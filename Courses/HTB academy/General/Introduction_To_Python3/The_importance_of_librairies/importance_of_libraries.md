---
tags:
  - python
  - scripting
  - web-scraping
  - course/htb-academy
---

# The Importance of Libraries

## requests

Library HTTP pour Python — permet d'envoyer des requêtes HTTP simplement, sans gérer manuellement les query strings, l'encodage POST, ou le connection pooling.

```bash
python3 -m pip install requests
```

```python
import requests

# Requête GET simple
resp = requests.get('http://httpbin.org/ip')
print(resp.content.decode())  # decode() : bytes → string UTF-8
```

Objets utiles sur la réponse : `resp.status_code`, `resp.cookies`, `resp.content`.

Pour maintenir un contexte entre plusieurs requêtes (cookies, session) :

```python
sess = requests.Session()
```

## BeautifulSoup (beautifulsoup4)

Transforme du HTML brut en objets Python navigables — bien plus pratique que parser du texte à la main.

```bash
python3 -m pip install beautifulsoup4
```

```python
from bs4 import BeautifulSoup

soup = BeautifulSoup(html_doc, 'html.parser')
print(soup.prettify())  # Affiche le HTML indenté proprement
```

- La classe `BeautifulSoup` est dans le module `bs4` — d'où le `from bs4 import`.
- Le parser `'html.parser'` est celui fourni par Python en standard.
