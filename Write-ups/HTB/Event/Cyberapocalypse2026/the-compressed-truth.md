---
title: The Compressed Truth
platform: HackTheBox
event: Cyber Apocalypse 2026
category: Forensics
difficulty: Easy
tags: [forensics, registry, windows, dfir, 7zip, keefarce, writeup/htb]
date: 2026-07-26
---

# The Compressed Truth

## Contexte

Investigation DFIR sur un poste Windows compromis. L'opérateur est désigné sous le nom **CROWQUILL**. Sept questions à résoudre, uniquement à partir d'artefacts Registry.

## Dataset

```
C/Users/cyberjunkie/NTUSER.DAT (+ LOG1, LOG2)
C/Users/Default/NTUSER.DAT     (+ LOG1, LOG2)
C/Users/vmarr/NTUSER.DAT       (+ LOG1)
C/Windows/System32/config/DEFAULT (+ LOG1, LOG2)
```

Premier constat  : **uniquement des hives utilisateur**. Pas de `SYSTEM`, pas de `SOFTWARE`, pas de `SAM`, et surtout **pas de `USRCLASS.DAT`**.

Conséquence directe : les ShellBags sont hors-jeu. `BagMRU` vit dans `USRCLASS.DAT` sous Win7+, pas dans `NTUSER.DAT`. Le plugin RegRipper `shellbags` le dit explicitement et échoue.

Trois profils, dont `Default` qui est le template de création de profil, inerte par construction. Restent `cyberjunkie` et `vmarr`.

## Setup

RegRipper n'est pas packagé sur Exegol. Installation manuelle :

```bash
git clone https://github.com/keydet89/RegRipper3.0 /opt/regripper
apt install -y libparse-win32registry-perl
```

- `rip.pl` embarque un shebang Windows (`c:\perl\bin\perl.exe`) → appeler `perl rip.pl`

```bash
perl /opt/regripper/rip.pl -r /root/Downloads/C/Users/vmarr/NTUSER.DAT -f ntuser > /tmp/vm.txt 2>&1
grep -c "Unable to open" /tmp/vm.txt   
```

**à faire en premier réflexe. Les valeurs Registry sont en UTF-16LE, d'où le `-el` :

```bash
strings -el NTUSER.DAT | grep -iE '7-zip|\.(7z|zip|rar|tar)' | sort -u
```


## L'artefact central : `HKCU\Software\7-Zip`

Tout le challenge repose là-dessus. **7-Zip journalise son propre historique dans la Registry**, sans rotation ni limite de rétention, en texte quasi brut.

| Clé | Sémantique forensique |
|---|---|
| `FM\FolderHistory` | tout dossier ouvert dans le File Manager, **y compris à l'intérieur d'une archive** |
| `FM\PanelPath0` | dernier dossier affiché à la fermeture |
| `FM\CopyHistory` | destinations de copie / déplacement |
| `Compression\ArcHistory` | archives **créées** |
| `Extraction\PathHistory` | destinations d'extraction |

Le détail décisif : quand 7-Zip navigue *dans* une archive, il la traite comme un dossier virtuel et écrit le chemin avec l'archive **au milieu du path** :

```
C:\...\oath_records_cinderbound_vol2.zip\oath_records_cinderbound_vol2\saltoaths_secretive\
```

D'où le pattern de recherche qui isole l'énumération intra-archive — un backslash *après* l'extension :

```bash
strings -el NTUSER.DAT | grep -iE '\.(zip|7z|rar|tar)\\' | sort -u
```

L'activité 7-Zip est présente chez `vmarr` et absente chez `cyberjunkie`. CROWQUILL identifié.

## Dump

```
FM LastWrite:          [2026-06-18 13:26:47Z]
Compression LastWrite: [2026-06-18 13:25:06Z]
Extraction LastWrite:  [2026-06-18 13:15:15Z]

FM\PanelPath0: c:\users\vmarr\desktop\working\

Compression\ArcHistory:
  C:\Users\Public\Pictures\shardchain.tar

Extraction\PathHistory:
  C:\Users\vmarr\AppData\Local\Temp\writ\KeeFarce\

FM\CopyHistory:
  c:\users\public\music\saltwork\

FM\FolderHistory:
  c:\users\vmarr\desktop\working\
  c:\users\public\music\saltwork\
  c:\users\vmarr\appdata\Roaming\KeePass\
  C:\Users\vmarr\Documents\Registry\shard_references\
  C:\Users\vmarr\Documents\Registry\shard_storage\
  C:\Users\vmarr\Documents\Registry\shard_storage\ShardKeepass_FirstMark\
  C:\Users\vmarr\Documents\Registry\shard_ref\
  C:\Users\vmarr\Documents\Registry\internal_reports\
  C:\Users\vmarr\Documents\Registry\custody_chains\
  C:\Users\vmarr\Documents\Registry\oath_records_cinderbound_vol2.zip\
  C:\Users\vmarr\Documents\Registry\oath_records_cinderbound_vol2.zip\oath_records_cinderbound_vol2\
  C:\Users\vmarr\Documents\Registry\oath_records_cinderbound_vol2.zip\oath_records_cinderbound_vol2\saltoaths_secretive\
  C:\Users\vmarr\Documents\
  C:\Users\vmarr\Downloads\
```

## Kill chain

```
1. ACCÈS       KeeFarce extrait dans %TEMP%\writ\KeeFarce\      [Extraction\PathHistory]
2. CREDENTIALS dump KeePass depuis Roaming\KeePass\             [FolderHistory]
3. RECON       énumération Documents\Registry\*                 [FolderHistory]
4. INSPECTION  ouverture de oath_records_cinderbound_vol2.zip   [FolderHistory]
5. COLLECTION  copie vers Public\Music\saltwork\                [CopyHistory]
6. PACKAGING   shardchain.tar dans Public\Pictures\             [ArcHistory]
7. FIN         retour dans Desktop\working\                     [PanelPath0]
```

### Technique offensive

**KeeFarce** — il n'attaque pas le `.kdbx` chiffré. Il s'injecte dans le processus KeePass **déverrouillé** et exporte la base en clair depuis la mémoire. D'où la formulation de l'énoncé : *did not break the lock — took the key while it was still held*.

**Staging dans `C:\Users\Public\`** — world-writable, hors profil utilisateur, souvent exclu des scans EDR et rarement monitoré. `Music\` pour la collecte, `Pictures\` pour l'archive finale : dissimulation par emplacement banal.

## Sur les timestamps

RegRipper affiche des `LastWrite` de **clé Registry**, en UTC (le `Z` en suffixe). Ce n'est pas un timestamp de fichier.

Pour `Extraction`, `13:15:15Z` correspond au moment où 7-Zip a écrit le chemin d'extraction dans la Registry — bonne proxy de l'extraction elle-même, mais la nuance compte : on date une **écriture Registry**, pas une action système. Croiser avec MFT ou USN Journal si le dataset le permettait.

## Réponses

| # | Question | Réponse |
|---|---|---|
| 1 | Outil d'extraction mémoire | `KeeFarce` |
| 2 | Extraction de l'outil | `2026-06-18 13:15:15` |
| 3 | Deepest folder dans l'archive | `saltoaths_secretive` |
| 4 | Staging | `C:\Users\Public\Music\saltwork\` |
| 5 | Archive d'exfil | `shardchain.tar` |
| 6 | Fichier maître | `C:\Users\vmarr\Documents\Registry\shard_storage\ShardKeepass_FirstMark\` |
| 7 | Fin des opérations | `C:\Users\vmarr\Desktop\working\` |

## Retex

À automatiser / systématiser :

1. **`strings -el` en premier**, toujours. Zéro dépendance, deux secondes, et sur ce type de challenge ça donne déjà l'essentiel.
2. **Chemins absolus systématiques** dès qu'on enchaîne des blocs de commandes.
3. **Vérifier que la sortie existe** avant de grep dedans : `wc -l` ou `grep -c "Unable to open"` après chaque dump.

## À retenir

- `USRCLASS.DAT` absent → ShellBags hors-jeu. Vérifier le contenu du dataset **avant** de choisir les plugins.
- `HKCU\Software\7-Zip` est un artefact de premier ordre, souvent négligé au profit des ShellBags alors qu'il est bien plus lisible.
- Le pattern `\.(zip|7z|rar|tar)\\` isole l'énumération intra-archive.
- Les valeurs Registry sont en UTF-16LE → `strings -el`, jamais `strings` seul.
- `LastWrite` de clé ≠ timestamp de fichier.
