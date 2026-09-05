---
tags:
  - python
  - scripting
  - web-scraping
  - course/htb-academy
---

# Continuously Improving The Code

## Principe : refactoring

Le **refactoring** consiste à restructurer le code existant pour le rendre plus lisible, réutilisable et maintenable — sans changer ce qu'il fait.

Règle d'or : si un bloc de code doit être répété, le transformer en fonction.

## Extraction en fonctions

### Récupérer le HTML

```python
def get_html_of(url):
    resp = requests.get(url)
    if resp.status_code != 200:
        print(f'HTTP status code of {resp.status_code} returned, but 200 was expected. Exiting...')
        exit(1)
    return resp.content.decode()
```

### Extraire tous les mots d'une URL

```python
def get_all_words_from(url):
    html = get_html_of(url)
    soup = BeautifulSoup(html, 'html.parser')
    raw_text = soup.get_text()
    return re.findall(r'\w+', raw_text)
```

### Compter les occurrences

```python
def count_occurrences_in(word_list):
    word_count = {}
    for word in word_list:
        if word not in word_count:
            word_count[word] = 1
        else:
            word_count[word] = word_count.get(word) + 1
    return word_count
```

### Trier et retourner le top

```python
def get_top_words_from(url):
    all_words = get_all_words_from(url)
    occurrences = count_occurrences_in(all_words)
    return sorted(occurrences.items(), key=lambda item: item[1], reverse=True)
```

## Code final refactorisé

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

def count_occurrences_in(word_list):
    word_count = {}
    for word in word_list:
        if word not in word_count:
            word_count[word] = 1
        else:
            word_count[word] = word_count.get(word) + 1
    return word_count

def get_all_words_from(url):
    html = get_html_of(url)
    soup = BeautifulSoup(html, 'html.parser')
    raw_text = soup.get_text()
    return re.findall(r'\w+', raw_text)

def get_top_words_from(url):
    all_words = get_all_words_from(url)
    occurrences = count_occurrences_in(all_words)
    return sorted(occurrences.items(), key=lambda item: item[1], reverse=True)

top_words = get_top_words_from(PAGE_URL)

for i in range(10):
    print(top_words[i][0])
```

Chaque fonction a une responsabilité unique — le code principal se réduit à deux lignes.
