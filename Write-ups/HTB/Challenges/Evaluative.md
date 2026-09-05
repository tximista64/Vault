---
tags:
  - writeup/htb
  - ctf
  - misc
  - python
  - algorithms
---

# Evaluative -- Polynomial Evaluation

## Énoncé résumé

On nous fournit :\
- neuf coefficients entiers (a_0, a_1, ..., a_8) ((-100 `\leq `{=tex}a_i
`\leq 100`{=tex})),\
- un entier (x) ((-100 `\leq `{=tex}x `\leq 100`{=tex})).

On doit calculer la valeur du polynôme :

\[ P(x) = a_0 + a_1 x + a_2 x\^2 + `\ldots `{=tex}+ a_8 x\^8 \]

et afficher le résultat.

Exemple :\
Entrée

    1 -2 3 -4 5 -6 7 -8 9
    5

Sortie

    2983941

------------------------------------------------------------------------

## Analyse

Le calcul direct impliquerait de faire des puissances de (x), ce qui est
inutilement coûteux. La méthode optimale est l'**algorithme de Horner**.
Il consiste à factoriser le polynôme ainsi :

\[ P(x) = (...(((a_8 x + a_7)x + a_6)x + `\ldots `{=tex}+ a_1)x + a_0)
\]

Cela permet d'évaluer le polynôme en temps linéaire et sans calculer
explicitement les puissances.

------------------------------------------------------------------------

## Implémentation en Python

``` python
import sys

a = list(map(int, sys.stdin.readline().split()))
x = int(sys.stdin.readline())

res = 0
for c in reversed(a):  # de a8 à a0
    res = res * x + c

print(res)
```

------------------------------------------------------------------------

## Vérification avec l'exemple

Entrée :

    1 -2 3 -4 5 -6 7 -8 9
    5

Sortie :

    2983941

La sortie correspond bien à l'exemple.

------------------------------------------------------------------------
![](Screenshot_20250913_215113.png)
## Conclusion

Le challenge consistait simplement à évaluer un polynôme de degré 8. La
bonne approche est l'algorithme de Horner, qui offre un code compact,
efficace et robuste.

