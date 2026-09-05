---
tags:
  - python
  - scripting
  - web-scraping
  - course/htb-academy
---

# Further Improvements

## Bloc `__main__`

Pour éviter que le code s'exécute lors d'un `import`, tout le code "actif" doit être dans le bloc main :

```python
if __name__ == '__main__':
    main()
```

Le code dans ce bloc ne s'exécute que quand le script est lancé directement, pas quand il est importé.

## Arguments en ligne de commande avec click

`click` permet d'ajouter des arguments nommés au script via des **decorators** (`@`).

```bash
pip3 install click
```

```python
import click

@click.command()
@click.option('--url', '-u', prompt='Web URL', help='URL of webpage to extract from.')
@click.option('--length', '-l', default=0, help='Minimum word length (default: 0, no limit).')
def main(url, length):
    ...

if __name__ == '__main__':
    main()
```

- `@click.command()` : déclare la fonction comme commande CLI.
- `@click.option(...)` : définit un argument nommé. Le nom du paramètre Python doit correspondre au `--name` (sans les `--`).
- `default=` : valeur par défaut si l'argument n'est pas fourni.
- `prompt=` : demande une saisie interactive si l'argument est absent.
- `--help` est généré automatiquement.

```bash
python3 wordextractor.py --url http://foo.bar --length 5
python3 wordextractor.py --help
```

## Filtrage par longueur minimale

Le paramètre `min_length` est propagé jusqu'à `count_occurrences_in` :

```python
def count_occurrences_in(word_list, min_length):
    word_count = {}
    for word in word_list:
        if len(word) < min_length:
            continue  # passe au mot suivant sans l'ajouter
        if word not in word_count:
            word_count[word] = 1
        else:
            word_count[word] = word_count.get(word) + 1
    return word_count
```

`continue` dans une boucle = ignorer le reste du bloc et passer à l'itération suivante.

## Script final complet

```python
import click
import requests
import re
from bs4 import BeautifulSoup

def get_html_of(url):
    resp = requests.get(url)
    if resp.status_code != 200:
        print(f'HTTP status code of {resp.status_code} returned, but 200 was expected. Exiting...')
        exit(1)
    return resp.content.decode()

def count_occurrences_in(word_list, min_length):
    word_count = {}
    for word in word_list:
        if len(word) < min_length:
            continue
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

def get_top_words_from(all_words, min_length):
    occurrences = count_occurrences_in(all_words, min_length)
    return sorted(occurrences.items(), key=lambda item: item[1], reverse=True)

@click.command()
@click.option('--url', '-u', prompt='Web URL', help='URL of webpage to extract from.')
@click.option('--length', '-l', default=0, help='Minimum word length (default: 0, no limit).')
def main(url, length):
    the_words = get_all_words_from(url)
    top_words = get_top_words_from(the_words, length)
    for i in range(10):
        print(top_words[i][0])

if __name__ == '__main__':
    main()
```

## Pistes d'amélioration

- `--output / -o` : écrire le résultat dans un fichier plutôt que la console.
- Mutations de passwords : majuscules, années, symboles (`Summer2021!`…).
- `--depth / -d` : crawler les URLs trouvées sur la page jusqu'à une profondeur donnée.
- Bug à corriger : le script crashe si `--length` ≥ 10 (indice : vérifier la dernière boucle `for`).
