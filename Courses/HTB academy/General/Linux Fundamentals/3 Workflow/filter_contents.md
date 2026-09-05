---
tags:
  - linux
  - shell
  - regular-expressions
  - course/htb-academy
---

# Filter Contents

## Pagers — lire un fichier page par page

| Commande | Différence |
|---|---|
| `more fichier` | Avance seulement — sortie reste dans le terminal après `q` |
| `less fichier` | Avant/arrière, recherche — sortie **disparaît** après `q` |

---

## Outils de filtrage

### head / tail

```bash
head /etc/passwd          # 10 premières lignes (défaut)
head -n 5 /etc/passwd     # 5 premières lignes
tail /etc/passwd          # 10 dernières lignes
tail -f /var/log/syslog   # Suivi en temps réel (logs)
```

### sort

```bash
cat /etc/passwd | sort            # Tri alphabétique
cat /etc/passwd | sort -t: -k3 -n # Tri numérique sur le 3e champ (UID)
```

### grep

```bash
cat /etc/passwd | grep "/bin/bash"          # Lignes contenant le pattern
cat /etc/passwd | grep -v "false\|nologin"  # Exclure les lignes matchant
cat /etc/passwd | grep -i "ROOT"            # Insensible à la casse
cat /etc/passwd | grep -c "/bin/bash"       # Compter les occurrences
```

### cut

```bash
# Extraire le 1er champ (username) délimité par :
cat /etc/passwd | cut -d":" -f1

# Extraire plusieurs champs
cat /etc/passwd | cut -d":" -f1,3,6
```

### tr

```bash
# Remplacer : par espace
cat /etc/passwd | tr ":" " "

# Majuscules → minuscules
cat fichier | tr 'A-Z' 'a-z'
```

### column

```bash
# Affichage tabulaire aligné
cat /etc/passwd | tr ":" " " | column -t
```

### awk

```bash
# Afficher le 1er et le dernier champ
cat /etc/passwd | tr ":" " " | awk '{print $1, $NF}'

# Afficher un champ spécifique
awk -F: '{print $1}' /etc/passwd

# Filtrer et afficher
awk -F: '$3 >= 1000 {print $1, $3}' /etc/passwd  # Users avec UID ≥ 1000
```

### sed

```bash
# Substitution globale (s/pattern/remplacement/g)
cat /etc/passwd | sed 's/bin/HTB/g'

# Supprimer des lignes contenant un pattern
sed '/nologin/d' /etc/passwd

# Édition en place d'un fichier
sed -i 's/ancien/nouveau/g' fichier.txt
```

### wc

```bash
wc -l fichier     # Nombre de lignes
wc -w fichier     # Nombre de mots
wc -c fichier     # Nombre de bytes
```

---

## Chaîne complète — exemple

```bash
cat /etc/passwd \
  | grep -v "false\|nologin" \
  | tr ":" " " \
  | awk '{print $1, $NF}' \
  | sort \
  | column -t
```

```
cry0l1t3     /bin/bash
htb-student  /bin/bash
mrb3n        /bin/bash
postgres     /bin/bash
root         /bin/bash
sync         /bin/sync
```

---

## Récapitulatif

| Outil | Rôle |
|---|---|
| `more` / `less` | Lire page par page |
| `head` / `tail` | Début / fin d'un fichier |
| `sort` | Trier |
| `grep` | Filtrer par pattern |
| `cut` | Extraire un champ délimité |
| `tr` | Remplacer des caractères |
| `column` | Alignement tabulaire |
| `awk` | Extraction/traitement de colonnes |
| `sed` | Substitution via regex |
| `wc` | Compter lignes/mots/bytes |




question finale:


```
╭─tximi at zawarud0 
╰─○ curl -s https://www.inlanefreight.com | grep -oE 'https://www\.inlanefreight\.com/[^"'\'' ]*' | sort -u | wc -l  
``` 

option -o pour afficher uniquement la partie devant matcher 
la regex [^"'\'' ]* permet de nier '" et un espace et * pour 0 ou plusieurs caractères.
