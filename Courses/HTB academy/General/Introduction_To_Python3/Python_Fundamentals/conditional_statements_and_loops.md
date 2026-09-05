---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Conditional Statements and Loops

## If / Elif / Else

```python
happy = 2

if happy == 1:
    print("Happy and we know it!")
elif happy == 2:
    print("Excited about it!")
else:
    print("Not happy...")
```

- `if` évalue une condition. `if some_var` est un raccourci pour `if some_var == True`.
- `elif` (else-if) enchaîne une condition supplémentaire si la précédente est fausse.
- `else` capture tous les cas restants.
- L'**indentation** délimite les blocs — 4 espaces par convention.

## While-loop

S'exécute tant que la condition est `True`.

```python
counter = 0

while counter < 5:
    print(f'Hello #{counter}')
    counter = counter + 1
```

Penser à incrémenter le compteur pour éviter une boucle infinie.

## F-strings

Introduites en Python 3.6, permettent d'insérer des valeurs dans une chaîne au runtime :

```python
equation = f'The meaning of life might be {6 * 7}.'  # → 42
greeting = f'Hello {me}!'
```

## Listes

Collection ordonnée d'éléments, indexée à partir de `0`.

```python
groceries = ['Walnuts', 'Grapes', 'Bird seeds']
# index :        0          1          2
```

- `groceries[0]` → `'Walnuts'`
- `groceries[-1]` → dernier élément (`'Bird seeds'`)

## Indexation des strings

Les strings fonctionnent comme des listes de caractères :

```python
var = "ABCDEF"
var[0]    # → 'A'
var[-1]   # → 'F'
var[:2]   # → 'AB'      (jusqu'à l'index 2 exclu)
var[2:]   # → 'CDEF'    (à partir de l'index 2)
var[2:4]  # → 'CD'
var[-2:]  # → 'EF'
```

## For-each loop

Itère sur chaque élément d'une collection :

```python
groceries = ['Walnuts', 'Grapes', 'Bird seeds']

for food in groceries:
    print(f'I bought some {food} today.')
```

Structure : `for <variable> in <collection>`. À chaque itération, `food` prend la valeur de l'élément courant.
