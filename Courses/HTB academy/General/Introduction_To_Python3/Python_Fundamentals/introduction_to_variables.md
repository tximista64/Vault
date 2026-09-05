---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Introduction to Variables

Une variable stocke une valeur en mémoire (nombre, texte, bytes…). Les noms doivent être descriptifs.

## Types de base

```python
advice = "Don't panic"      # string
ultimate_answer = 42        # integer
potential_question = 6 * 7  # integer (évalué à 42 au runtime)
confident = True            # boolean
something_false = False     # boolean
problems = None             # None
# Ceci est un commentaire
```

- **Strings** : entre `"double"` ou `'single'` quotes. Utiliser les doubles si la chaîne contient une apostrophe.
- **Integers** : entiers, peuvent être le résultat d'une expression évaluée au runtime.
- **Booleans** : `True` ou `False`.
- **None** : valeur "néant", équivalent du `null` dans d'autres langages. Utile pour déclarer une variable sans valeur initiale, ou signaler l'absence de résultat.
- **Comments** : ignorés à l'exécution, préfixés par `#`. À utiliser avec parcimonie — le code bien écrit se suffit à lui-même.

## Opérations mathématiques de base

```python
>>> 10 + 10   # Addition       → 20
>>> 20 - 10   # Soustraction   → 10
>>> 5 * 5     # Multiplication → 25
>>> 10 / 5    # Division       → 2
```

Les noms de variables peuvent être librement choisis, mais doivent commencer par une lettre ou `_`.

## Combiner des variables

```python
>>> add = 10 + 10
>>> sub = 20 - 10
>>> multi = 5 * 5
>>> div = 10 / 5
>>> result = (add * sub) - (multi * div)   # (20 * 10) - (25 * 2) = 150
>>> print('Result: ', result)
Result:  150
```

## Variable `_` dans l'IDLE

Dans l'IDLE, `_` contient automatiquement le résultat de la dernière expression :

```python
>>> 38 + 4
42
>>> 50 - _   # 50 - 42 = 8
8
```

Dans un fichier `.py`, `_` est une variable ordinaire — conventionnellement utilisée comme placeholder pour les valeurs qu'on n'a pas besoin de garder :

```python
x_coord, _ = get_position_of_birb()
```

## Coding style

Python suit la convention **snake_case** : noms en minuscules, mots séparés par `_`. Le guide de référence est **PEP8**. Un style cohérent facilite la lecture, le debug et la maintenance du code.
