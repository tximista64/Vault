---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Executing Python Code

Deux méthodes principales pour exécuter du code Python : via un fichier `.py` ou directement dans le **IDLE**.

## Fichier `.py`

Approche standard pour développer un script. Exemple minimal :

```python
print("Hello Academy!")
```

Sauvegardé en `welcome.py`, on l'exécute avec :

```bash
python3 welcome.py
```

## IDLE

L'**IDLE** (Integrated Development and Learning Environment) est l'interpréteur interactif de Python, utile pour tester rapidement. On le lance sans argument :

```bash
python3
```

Dans la session IDLE :
- Les expressions sont évaluées et le résultat affiché immédiatement.
- Les variables stockent une valeur sans rien afficher.
- On peut importer des libraries, définir des fonctions et des classes.
- On quitte avec `exit(0)` — le code `0` signifie succès, tout autre valeur indique une erreur.

```python
>>> 4 + 3
7
>>> foo = 3 * 5
>>> foo
15
>>> print('Hello Academy!')
Hello Academy!
```

**Important** : Python exécute le code de haut en bas. Une variable doit être définie avant d'être utilisée.

```python
>>> greeting = 'Hello again, Academy'
>>> print(greeting)
Hello again, Academy
```

`print()` accepte plusieurs variables en argument :

```python
>>> a = 'HTB'
>>> b = 'Academy'
>>> print(a, b)
HTB Academy
```

## Shebang

Sur les systèmes Unix, on peut rendre un script directement exécutable en ajoutant un **shebang** en première ligne :

```python
#!/usr/bin/env python3

print("Hello Academy!")
```

Puis on donne les droits d'exécution :

```bash
chmod +x welcome.py
./welcome.py
```

Plus besoin de préfixer avec `python3`.
