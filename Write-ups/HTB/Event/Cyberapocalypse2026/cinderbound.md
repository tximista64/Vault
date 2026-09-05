---
title: Cinderbound
platform: HackTheBox
event: Cyber Apocalypse 2026
category: Reverse
difficulty: Very Easy
tags: [reverse, micropython, mpy, bytecode, xor, rolling-state, writeup/htb]
date: 2026-07-26
---

# Cinderbound

## Contexte

Un seul fichier fourni : `cinderbound.mpy`, 221 octets. 
L'intro lore parle de serments « pressés dans un moteur étranger, quelque chose de construit hors de l'artisanat de l'Ashguard, illisible pour tout prêtre formé aux seuls ciseaux anciens ». Traduction : **le format n'est pas celui auquel tu t'attends**, et tes outils Python habituels ne l'ouvriront pas.

C'est effectivement le cas — `uncompyle6`, `decompyle3`, `dis` ne servent à rien ici.

## Reconnaissance

Premier réflexe, `strings` :

```
$ strings cinderbound.mpy
judge_src.py
judge
syllable
 #$#*2.0#
```

Maigre — mais déjà instructif : `judge_src.py` est un **nom de fichier source**, et `judge` / `syllable` ressemblent à un nom de fonction et son paramètre. Donc du code compilé qui a gardé ses symboles.

`strings` filtre à 4 caractères minimum par défaut, ce qui masque les données courtes. Un `cat` brut les fait apparaître :

```
$ cat cinderbound.mpy
judge_src.py
judgeysyllable...W.o.Y
57129154311991927324343176255173542036715L2Qc.@Y #$#*2.0#...
```

Cette longue suite de chiffres, c'est le tuple de constantes — chaque entier est stocké sous forme de chaîne ASCII courte, donc invisible pour `strings` par défaut. `strings -n 3` ou `-n 2` les remonte.

Signal fort : une donnée numérique en dur + une fonction nommée `judge(syllable)` = **un validateur qui compare une entrée à une référence**.

## Identification

```bash
$ file cinderbound.mpy
cinderbound.mpy: data

$ od -A x -t x1z -v cinderbound.mpy | head -3
000000 4d 06 00 1f 08 01 18 6a 75 64 67 65 5f 73 72 63  >M......judge_src<
000010 2e 70 79 00 0f 0a 6a 75 64 67 65 00 79 10 73 79  >.py...judge.y.sy<
```

`file` ne reconnaît pas. Le header parle quand même :

| Octet | Valeur | Sens |
|---|---|---|
| 0 | `0x4D` = `'M'` | magic MicroPython |
| 1 | `0x06` | version mpy **6** |


Donc : **bytecode MicroPython**, pas CPython. Ce n'est pas un `.pyc`.

Le mapping version mpy → release MicroPython compte, parce que l'outil de désassemblage doit correspondre :

| mpy | MicroPython |
|---|---|
| 5 | 1.12 – 1.18 |
| **6** | **1.19 – 1.22** |
| 7 | 1.23+ |

## Toolchain

C'est là que le temps se perd, pas sur l'algo. `mpy-tool.py` a deux dépendances qu'il faut récupérer **depuis la même release**, sinon le parsing des qstr casse :

```bash
V=v1.22.2
B=https://raw.githubusercontent.com/micropython/micropython/$V
curl -sfLO $B/tools/mpy-tool.py
curl -sfLO $B/py/makeqstrdata.py
curl -sfLO $B/py/qstrdefs.h

python3 mpy-tool.py -d cinderbound.mpy
```

Erreurs rencontrées dans l'ordre :
- `ModuleNotFoundError: No module named 'makeqstrdata'` → il manque `py/makeqstrdata.py`
- ensuite `qstrdefs.h` peut être réclamé → même origine

## Désassemblage

```
qstr_table[8]: judge_src.py, <module>, judge, append, syllable, len, ord, list
obj_table: [(57, 129, 154, 31, 199, 192, 73, 243, 43, 176, 255, 173, 54, 203, 67, 15)]
```

Le module ne fait que définir une fonction :

```
MAKE_FUNCTION 0
STORE_NAME judge
LOAD_CONST_NONE
RETURN_VALUE
```

Aucun `print`, aucun `input`. **Le fichier est une bibliothèque à un seul élément, pas un programme.** Le lancer ne produit rien .

### Mapping des slots

`STORE_FAST n` = rangement dans la variable locale `n` :

| Slot | Contenu |
|---|---|
| 0 | `syllable` (argument) |
| 1 | le tuple de 16 ints |
| 2 | `90` — état initial |
| 3 | liste vide — accumulateur |
| 4 | index de boucle |
| 5 | valeur calculée |

### loop

```
LOAD_GLOBAL ord / LOAD_FAST 0 / LOAD_FAST 4 / LOAD_SUBSCR / CALL   → ord(syllable[i])
LOAD_FAST 2 / BINARY_OP __xor__                                    → ^ state
LOAD_FAST 4 / CONST 13 / __mul__ / CONST 255 / __and__ / __xor__   → ^ ((i*13) & 255)
STORE_FAST 5

LOAD_FAST 2 / ord(syllable[i]) / __add__ / CONST 255 / __and__     → state = (state + c) & 255
STORE_FAST 2

LOAD_FAST 3 / LOAD_METHOD append / LOAD_FAST 5 / CALL_METHOD 1     → out.append(...)
```

Sortie :

```
LOAD_FAST 3 / LOAD_GLOBAL list / LOAD_FAST 1 / __eq__ / RETURN_VALUE
```

## Source reconstruite

```python
def judge(syllable):
    target = (57,129,154,31,199,192,73,243,43,176,255,173,54,203,67,15)
    state = 90
    out = []
    for i in range(len(syllable)):
        out.append((ord(syllable[i]) ^ state) ^ ((i * 13) & 255))
        state = (state + ord(syllable[i])) & 255
    return out == list(target)
```

## Inversion

XOR roulant. Chaque octet est masqué par deux valeurs :
- `state`,  **déjà traités**
- `(i*13) & 255`, un masque positionnel 

```python
target = [57,129,154,31,199,192,73,243,43,176,255,173,54,203,67,15]
state, out = 90, []
for i, c in enumerate(target):
    o = c ^ ((i * 13) & 255) ^ state
    out.append(o)
    state = (state + o) & 255
print("".join(map(chr, out)))
```

```
c1nd3rbound_v0w5
```


## Vérification par exécution

Pour confirmer, il faut un runtime MicroPython — il ne s'installe pas via pip, on compile le port unix :

```bash
apt install -y build-essential libffi-dev pkg-config git
git clone --depth 1 --branch v1.22.2 https://github.com/micropython/micropython
cd micropython/ports/unix
make submodules && make -j$(nproc)
# fallback si libffi coince : make MICROPY_PY_FFI=0 -j$(nproc)
ln -s $PWD/build-standard/micropython /usr/local/bin/mpy
```

Le `.mpy` doit être **importé**, pas passé en argument :

```bash
$ mpy cinderbound.mpy
SyntaxError: invalid syntax         

$ mpy -c "import cinderbound; print(cinderbound.judge('c1nd3rbound_v0w5'))"
True
```

## Contrôle d'exhaustivité

Initialement le flag trouvé ne valide pas le challenge un petit lifting le permet cette broutille m'a fait galérer


```
HTB{c1nd3rbound_v0w5}
```
