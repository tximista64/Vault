---
tags:
  - python
  - scripting
  - oop
  - course/htb-academy
---

# Making Code Classy

## Classes : principe

Une classe est un modèle (comme une recette) qui définit comment créer des **objets**. Les noms de classes suivent la convention **CapWords** (`DreamCake`, `MyClass`).

```python
class DreamCake:
    eggs = 4
    sugar = 300
    topping = None
    is_baked = False

    def __init__(self, topping='No topping', garnish='No garnish'):
        self.topping = topping
        self.garnish = garnish

    def bake(self):
        self.is_baked = True

    def is_cake_ready(self):
        return self.is_baked
```

Points clés :
- `__init__` : méthode appelée automatiquement à l'instanciation — sert à initialiser les variables de l'objet.
- `self` : premier paramètre obligatoire de toutes les méthodes. Permet à la classe de référencer ses propres variables (`self.topping`) et méthodes (`self.bake()`). On ne le fournit pas lors de l'appel.
- **Paramètres par défaut** : `topping='No topping'` — utilisé si aucune valeur n'est passée.

## Instanciation et appel de méthodes

```python
plain_cake = DreamCake()
chocolate_cake = DreamCake(topping='Chocolate frosting')
luxury_cake = DreamCake('Strawberry frosting', 'Chocolate bits')

chocolate_cake.bake()
print(chocolate_cake.is_cake_ready())  # True
```

## Notes avancées : Magic Methods

Les **Magic Methods** (préfixées et suffixées `__`) sont héritées de la classe de base `object` et peuvent être surchargées.

- `__init__` : constructeur.
- `__str__` : représentation string de l'objet (appelée par `str(obj)`).

```python
class Circle:
    def __init__(self, radius):
        self.radius = radius

    def __str__(self):
        return f'Circle(r={self.radius})'

>>> str(Circle(5))
'Circle(r=5)'
```

Sans `__str__`, Python retourne quelque chose comme `<__main__.Circle object at 0x022FFB98>`.

## Context Manager : `with`

Les méthodes `__enter__` et `__exit__` permettent d'utiliser une classe avec le mot-clé `with` — pratique pour gérer des ressources (connexions, fichiers) avec un build-up et un teardown automatiques.

```python
class Foo():
    def __enter__(self):
        print("Enter...")
    def __exit__(self, type, value, traceback):
        print("...and exit.")

with Foo():
    print("Hello world!")
# → Enter... / Hello world! / ...and exit.
```

Cas d'usage courant :

```python
with open('/path/to/file.txt', 'w') as wr:
    wr.write('something')
# Le fichier est fermé automatiquement à la sortie du bloc.
```
