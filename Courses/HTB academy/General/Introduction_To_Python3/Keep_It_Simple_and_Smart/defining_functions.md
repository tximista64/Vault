---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Defining Functions

Une fonction définit un bloc de code réutilisable qui peut accepter des paramètres et retourner une valeur.

## Syntaxe de base

```python
def power_of(x, exponent):
    return x ** exponent
```

- `def` : mot-clé pour déclarer une fonction.
- Nom en **snake_case**, suivi des paramètres entre parenthèses et d'un `:`.
- La première ligne s'appelle la **signature** de la fonction.
- `return` renvoie la valeur — sans `return`, la fonction renvoie `None`.
- `**` = "puissance de".

## Utiliser le résultat

```python
power_of(4, 2)           # résultat ignoré
eight = power_of(2, 3)   # résultat stocké dans "eight"
print(power_of(4, 2))    # résultat passé directement à print()
```

Python exécute les appels de l'intérieur vers l'extérieur : `power_of(4, 2)` est calculé en premier, puis son résultat est passé à `print()`.

## Paramètres positionnels vs nommés

Par défaut, les paramètres sont **positionnels** — l'ordre compte. Avec les **named parameters**, l'ordre n'a plus d'importance, et le code est plus lisible :

```python
def print_sample_invitation(mother, father, child, teacher, event):
    sample_text = f'''
Dear {mother} and {father}.
{teacher} and I would love to see you both as well as {child} at our {event} tomorrow evening.

Best regards,
Principal G. Sturgis.
'''
    print(sample_text)

print_sample_invitation(mother='Karen', father='John', child='Noah', teacher='Tina', event='Pizza Party')
```

## Scope

- Le code dans une fonction peut accéder aux variables du **scope global**.
- L'inverse est faux : une variable définie à l'intérieur d'une fonction n'est pas accessible à l'extérieur.
- Python exécute de haut en bas : fonctions et variables doivent être définies **avant** d'être appelées.
