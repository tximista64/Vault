---
tags:
  - python
  - scripting
  - web-scraping
  - course/htb-academy
---

# The First Iterations

Objectif : construire un script qui récupère les mots les plus fréquents d'une page web — utile par exemple pour générer une wordlist de passwords ciblée.

## Approche incrémentale

1. Télécharger et afficher le HTML d'une page.
2. Extraire tous les mots (sans les tags HTML).
3. Compter les occurrences de chaque mot.
4. Trier par fréquence et afficher le top 10.

## Étape 1 — Récupérer le HTML

```python
import requests

PAGE_URL = 'http://target:port'

def get_html_of(url):
    resp = requests.get(url)

    if resp.status_code != 200:
        print(f'HTTP status code of {resp.status_code} returned, but 200 was expected. Exiting...')
        exit(1)

    return resp.content.decode()

print(get_html_of(PAGE_URL))
```

Vérifier le `status_code` avant de traiter la réponse — évite un crash si l'URL est invalide.

## Étape 2 — Extraire les mots avec regex

```python
import re
from bs4 import BeautifulSoup

html = get_html_of(PAGE_URL)
soup = BeautifulSoup(html, 'html.parser')
raw_text = soup.get_text()          # Texte brut sans les tags HTML
all_words = re.findall(r'\w+', raw_text)
```

- `get_text()` : extrait le texte visible de la page.
- `re.findall(r'\w+', ...)` : retourne tous les mots (a-z, A-Z, 0-9, `_`).
- `r'...'` : **raw string** — le `\` est interprété littéralement, pas comme caractère d'échappement.

## Étape 3 — Compter les occurrences

```python
word_count = {}

for word in all_words:
    if word not in word_count:
        word_count[word] = 1
    else:
        current_count = word_count.get(word)
        word_count[word] = current_count + 1
```

`word_count` est un **dictionnaire** (structure clé/valeur). Pour chaque mot : on l'ajoute à 1 s'il est nouveau, ou on incrémente son compteur.

## Étape 4 — Trier et afficher le top 10

```python
top_words = sorted(word_count.items(), key=lambda item: item[1], reverse=True)

for i in range(10):
    print(top_words[i][0])  # [0] = le mot, [1] = le compte
```

`sorted()` retourne une liste de tuples `(mot, occurrences)` triée par valeur décroissante. `top_words[i][0]` extrait uniquement le mot.

## Code complet

```python
import requests
import re
from bs4 import BeautifulSoup

PAGE_URL = 'http://target:port'

def get_html_of(url):
    resp = requests.get(url)
    if resp.status_code != 200:
        print(f'HTTP status code of {resp.status_code} returned, but 200 was expected. Exiting...')
        exit(1)
    return resp.content.decode()

html = get_html_of(PAGE_URL)
soup = BeautifulSoup(html, 'html.parser')
raw_text = soup.get_text()
all_words = re.findall(r'\w+', raw_text)

word_count = {}
for word in all_words:
    if word not in word_count:
        word_count[word] = 1
    else:
        word_count[word] = word_count.get(word) + 1

top_words = sorted(word_count.items(), key=lambda item: item[1], reverse=True)

for i in range(10):
    print(top_words[i][0])
```
