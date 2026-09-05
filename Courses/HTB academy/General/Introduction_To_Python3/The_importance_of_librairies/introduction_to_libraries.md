---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Introduction to Libraries

Une **library** (ou module) est une collection de code réutilisable — fonctions, classes — qu'on peut importer dans un projet sans tout réécrire.

## Importer et explorer une library

```python
import datetime
dir(datetime)  # Liste le contenu du module
```

`dir()` est une fonction built-in qui liste les attributs et méthodes d'un objet ou module.

## Différentes formes d'import

```python
# Import complet — accès via le chemin complet
import datetime
now = datetime.datetime.now()

# Import d'une classe spécifique — accès direct
from datetime import datetime
print(datetime.now())

# Import avec alias — pour raccourcir
from datetime import datetime as dt
print(dt.now())
```

## Style PEP-8

- Deux lignes vides entre les `import` et le reste du code.
- Les noms de classes built-in (comme `datetime`) sont en minuscules par convention spécifique — ne pas confondre avec la règle générale CapWords.

## À retenir

Python dispose de nombreuses libraries incluses d'office (`datetime`, `os`, `sys`…). Des libraries externes peuvent également être installées — c'est l'objet de la section suivante.
