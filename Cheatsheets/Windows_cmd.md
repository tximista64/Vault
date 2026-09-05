# Windows Command Line - Cheat Sheet

**tags**: #cheatsheet #windows #cmd #powershell #sysadmin #réseau

---

## Connexions

| Command                                     | Description                                      |
|---------------------------------------------|--------------------------------------------------|
| `xfreerdp /v:<IP> /u:<user> /p:<password>` | Connexion RDP à une cible                        |
| `ssh <user>@<IP>`                          | Connexion SSH à une cible                        |

---

## Aide et Navigation

| Command               | Description                                  |
|-----------------------|----------------------------------------------|
| `help <commande>`    | Aide sur une commande Windows (CMD)          |
| `Get-Help <cmdlet>`  | Aide PowerShell                              |
| `Update-Help`        | Met à jour l’aide PowerShell                 |
| `Get-Module`         | Liste les modules chargés dans PowerShell    |
| `Import-Module`      | Importe un module dans la session PowerShell |
| `Get-Command`        | Liste tous les cmdlets, fonctions, alias     |
| `Set-Location <path>`| Change de répertoire (`cd`)                  |
| `Get-Content <file>` | Affiche le contenu d’un fichier              |
| `systeminfo`         | Informations système                         |
| `hostname`           | Nom de la machine                            |
| `ver`                | Version de Windows                           |

---

## Historique Terminal

| Touche / Commande     | Fonction                                               |
|------------------------|--------------------------------------------------------|
| `doskey /history`     | Affiche l’historique des commandes                     |
| `PageUp` / `PageDown` | Navigue dans l’historique                             |
| `↑` / `↓`             | Parcourt l’historique ligne par ligne                  |
| `→`                   | Complète une commande précédente caractère par caractère |
| `F3`, `F5`, `F7`, `F9`| Navigation avancée dans l’historique                   |

---

## Fichiers & Répertoires (CMD)

| Command                      | Description                                          |
|------------------------------|------------------------------------------------------|
| `dir`, `dir /A`, `/A:H`, `/A:R` | Lister les fichiers (normaux, cachés, en lecture seule) |
| `cd`, `chdir`               | Affiche ou change le dossier courant                 |
| `tree`, `tree /F`           | Affiche l’arborescence avec ou sans fichiers         |
| `cls`                       | Nettoie l’écran                                      |
| `mkdir`, `md`               | Crée un dossier                                      |
| `rmdir`, `rd`               | Supprime un dossier                                  |
| `rmdir /S`                  | Supprime récursivement dossiers et fichiers          |
| `move`, `copy`, `xcopy`, `robocopy` | Manipule les fichiers et dossiers            |
| `type`, `more`, `more /S`   | Affiche le contenu d’un fichier                      |
| `echo "text" > file`        | Écrit du texte dans un fichier                       |
| `echo "text" >> file`       | Ajoute du texte dans un fichier                      |
| `fsutil file createNew name length` | Crée un fichier vide de taille spécifiée   |
| `ren old new`               | Renomme un fichier                                   |
| `del`, `erase`              | Supprime un fichier                                  |

---

## Fichiers & Objets (PowerShell)

| Command                             | Alias                        | Description                                  |
|-------------------------------------|------------------------------|----------------------------------------------|
| `Get-Item`                          | `gi`                         | Récupère un fichier ou objet                 |
| `Get-ChildItem`                     | `ls`, `dir`, `gci`           | Liste contenu d’un dossier                   |
| `New-Item`                          | `md`, `mkdir`, `ni`          | Crée fichiers, dossiers, symlinks...         |
| `Set-Item`                          | `si`                         | Modifie un objet                             |
| `Copy-Item`                         | `copy`, `cp`, `ci`           | Copie un objet                               |
| `Rename-Item`                       | `ren`, `rni`                 | Renomme un objet                             |
| `Remove-Item`                       | `rm`, `del`, `rmdir`         | Supprime un objet                            |
| `Get-Content`                       | `cat`, `type`                | Affiche le contenu                           |
| `Add-Content "data"`               | `ac`                         | Ajoute du contenu                            |
| `Set-Content`                       | `sc`                         | Remplace le contenu                          |
| `Clear-Content`                     | `clc`                        | Vide le contenu                              |
| `Compare-Object`                    | `diff`, `compare`            | Compare deux objets                          |

---

## Redirections / Exécution

| Syntaxe                     | Description                                     |
|-----------------------------|-------------------------------------------------|
| `commande > fichier`       | Redirige la sortie dans un fichier (écrase)     |
| `commande >> fichier`      | Redirige la sortie en ajoutant                  |
| `commande < fichier`       | Utilise un fichier comme entrée                 |
| `commande1 | commande2`    | Pipe entre deux commandes                       |
| `commande1 & commande2`    | Exécute les deux successivement                 |
| `commande1 && commande2`   | Exécute la 2e si la 1re réussit                 |
| `commande1 || commande2`   | Exécute la 2e si la 1re échoue                  |

---

## Recherche / Filtrage

| Command                                 | Description                          |
|-----------------------------------------|--------------------------------------|
| `where`, `where /R`                    | Localise fichiers (récursivement)    |
| `find`, `findstr`                      | Recherche de texte dans des fichiers |
| `comp`, `fc`                           | Compare fichiers                     |
| `sort`                                 | Trie l'entrée                        |
| `Get-Item <obj> | Get-Member`          | Liste les propriétés                 |
| `Select-Object -Property`              | Filtrage par propriétés              |
| `Sort-Object`, `Group-Object`          | Tri et regroupement                  |
| `Get-ChildItem -Recurse -File`         | Recherche de fichiers (PowerShell)   |
| `where { $_.Name -like "*.txt" }`      | Filtrage par extension               |
| `sls "keyword"`                        | Recherche de contenu                 |

---

## Utilisateurs et Groupes

| Command                             | Description                                  |
|-------------------------------------|----------------------------------------------|
| `whoami`, `whoami /priv`, `/groups`| Informations utilisateur                     |
| `net user`, `net localgroup`        | Gestion utilisateurs & groupes (CMD)         |
| `Get-LocalUser`, `New-LocalUser`    | Gestion utilisateurs locaux (PowerShell)     |
| `Get-ADUser`, `New-ADUser`          | Gestion AD (si installé)                     |

---

## Réseau

| Command (CMD)                       | Description                               |
|-------------------------------------|-------------------------------------------|
| `ipconfig`, `ipconfig /all`         | Informations IP                           |
| `net`, `net share`, `net view`      | Infos réseau, partages                    |
| `arp`, `arp /a`                     | Cache ARP                                 |
| `netstat -an`                       | Connexions réseau                         |
| `nslookup <query>`                  | Résolution DNS                            |

| Command (PowerShell)               | Description                               |
|-----------------------------------|-------------------------------------------|
| `Get-NetIPInterface`              | Interfaces réseau                         |
| `Get-NetIPAddress`                | Config IP                                 |
| `Set-NetIPAddress`                | Modifier une IP                           |
| `Disable/Enable/Restart-NetAdapter`| Contrôle des interfaces                   |
| `Test-NetConnection`              | Diagnostic réseau                          |
| `Get-WindowsCapability`, `Add-WindowsCapability` | Gérer SSH/OpenSSH          |
| `Enter-PSSession`                 | Session PowerShell distante                |

---

## Variables d'environnement

| Command                            | Description                                |
|------------------------------------|--------------------------------------------|
| `%VAR%`, `set`, `echo %VAR%`       | Lire une variable                          |
| `set VAR=value`                    | Définir pour la session                    |
| `setx VAR "valeur"`                | Définir globalement (persistant)           |
| `set VAR=`, `setx VAR ""`          | Supprimer variable                         |

---

## Services

| Command                            | Description                                |
|------------------------------------|--------------------------------------------|
| `sc query`, `sc start/stop <Name>` | Interroger et gérer services (CMD)         |
| `tasklist /svc`                    | Associer services et processus             |
| `Get-Service`                      | Lister services (PowerShell)               |
| `Start/Stop/Set-Service`           | Contrôle de services                       |
| `Invoke-Command -ComputerName`     | Gérer services à distance                  |

---

## Tâches planifiées

| Command                            | Description                                |
|------------------------------------|--------------------------------------------|
| `schtasks /query`                  | Lister les tâches                          |
| `schtasks /create /tn <name> ...`  | Créer une tâche planifiée                  |
| `schtasks /change /tn <name> ...` | Modifier une tâche                         |
| `schtasks /delete /tn <name>`     | Supprimer une tâche                        |

---

## Interactions Web

| Command                                            | Description                        |
|----------------------------------------------------|------------------------------------|
| `Invoke-WebRequest -Uri URL`                      | Requête GET HTTP                   |
| `-OutFile <path>`                                 | Télécharger un fichier             |
| `(New-Object Net.WebClient).DownloadFile(...)`    | Télécharger via .NET               |

---

## Journaux d'événements

| Command                                             | Description                         |
|-----------------------------------------------------|-------------------------------------|
| `wevtutil el`, `qe`, `epl`                         | Outils événements Windows (CMD)     |
| `Get-WinEvent -LogName <log>`                      | Lire journaux (PowerShell)          |
| `FilterHashTable @{LogName='Security';ID='4625'}`  | Filtrage précis                     |

---

## Registre Windows

| Command                                             | Description                         |
|-----------------------------------------------------|-------------------------------------|
| `Get-Item -Path Registry::<HIVE>\...`              | Lire clé du registre                |
| `New-Item`, `New-ItemProperty`, `Remove-ItemProperty` | Créer/modifier/supprimer clé/valeur |
| `REG QUERY`, `REG ADD`                             | Manipuler registre (CMD)            |

---

## Extensions PowerShell

| Extension | Description                                |
|-----------|--------------------------------------------|
| `.ps1`    | Script PowerShell                          |
| `.psm1`   | Module PowerShell                          |
| `.psd1`   | Fichier de données de module               |

---

