---
tags:
  - writeup/htb
  - ctf
  - reverse-engineering
  - cryptography
  - cryptanalysis
  - prng
---

# Simple Encryptor


## Énoncé résumé

On nous fournit un exécutable nommé `encrypt` ainsi qu’un fichier `flag.enc`. Le but est de comprendre comment fonctionne l’algorithme de chiffrement afin de retrouver le flag.

---

## Étape 1 — Analyse statique de l’exécutable

En ouvrant l’exécutable dans **IDA**  on observe rapidement les symboles suivants utilisés dans `main` :

- `fopen`, `ftell`, `fseek`, `fclose`, `fread`, `malloc` : gestion classique de fichier.
    
- `time`, `srand`, `rand` : utilisation du générateur pseudo-aléatoire de la libc.
    
- Des instructions manipulant chaque octet du buffer lu.
    

On constate la séquence :

1. Lecture du fichier `flag`.
    
2. Appel à `time(0)` → retourne un entier qui sert de seed.
    
3. Appel à `srand(seed)`.
    
4. Boucle sur chaque octet :
    
    - `rand()` génère une valeur, dont l’octet bas est utilisé comme clé `k1`.
        
    - `rand() & 7` donne un décalage entre 0 et 7.
        
    - L’octet du message est d’abord **XOR** avec `k1`.
        
    - Puis il est **roté à gauche (ROL)** du nombre de bits calculé.
        
    - Le résultat est écrit dans le fichier de sortie.
        

En résumé, le chiffrement est : cipher = ROL8(plain ^ (rand() & 0xff), rand() & 7)

## Étape 2 — Analyse du fichier chiffré

Le fichier `flag.enc` est fourni.  
En l’ouvrant en hexadécimal, on remarque que les 4 premiers octets correspondent en fait à la **seed** utilisée (timestamp UNIX en little-endian).

Cela veut dire que le programme écrit directement la seed au début du fichier, puis les données chiffrées.

---

## Étape 3 — Stratégie de déchiffrement

Pour retrouver le flag, il faut :

1. Lire les 4 premiers octets de `flag.enc` pour extraire la seed.
    
2. Réinitialiser le PRNG de la libc avec `srand(seed)`.
    
3. Parcourir chaque octet chiffré à partir de l’offset 4 :
    
    - Rejouer `rand()` pour récupérer `k1` et `r`.
        
    - Appliquer l’inverse du chiffrement :
        
        - D’abord une **rotation à droite (ROR)** de `r` bits.
            
        - Ensuite un **XOR** avec `k1`.
            

Ainsi, l’algorithme inverse est : plain = ROR8(cipher, rand() & 7) ^ (rand() & 0xff)

## Étape 4 — Implémentation en Python

On reproduit l’algorithme en Python, en important `libc` pour accéder à `srand` et `rand` afin d’avoir le même comportement que le binaire d’origine.

```python
#!/usr/bin/env python3
import argparse
import ctypes
import re
import sys
import time
from datetime import datetime, timezone

PAT_FLAG = re.compile(rb'(HTB|FLAG)\{[^}]*\}')

libc = ctypes.CDLL("libc.so.6")
libc.srand.argtypes = [ctypes.c_uint]
libc.rand.restype = ctypes.c_int

def ror8(x: int, r: int) -> int:
    r &= 7
    return ((x >> r) | ((x << (8 - r)) & 0xFF)) & 0xFF

def decrypt_with_seed(cipher: bytes, seed: int, offset: int = 0) -> bytes:
    libc.srand(seed)
    out = bytearray(len(cipher))
    out[:offset] = cipher[:offset]
    for i in range(offset, len(cipher)):
        c = cipher[i]
        k1 = libc.rand() & 0xFF
        r  = libc.rand() & 0x07
        b  = ror8(c, r)
        p  = b ^ k1
        out[i] = p
    return bytes(out)

def parse_center(s: str) -> int:
    dt = datetime.strptime(s, "%Y-%m-%d %H:%M:%S").replace(tzinfo=timezone.utc)
    return int(dt.timestamp())

def main():
    ap = argparse.ArgumentParser(description="Decrypt HTB Simple Encryptor")
    ap.add_argument("-i", "--input", required=True, help="fichier chiffré (ex: flag.enc)")
    ap.add_argument("-o", "--output", default="flag.dec", help="fichier de sortie (défaut: flag.dec)")
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--seed", type=int, help="seed (time_t) connue")
    g.add_argument("--seed-from-file", dest="seed_from_file", action="store_true",
                   help="lire la seed dans les 4 premiers octets (little-endian)")
    g.add_argument("--bruteforce", action="store_true", help="bruteforce de la seed")
    ap.add_argument("--center", help='center UTC "YYYY-mm-dd HH:MM:SS" (défaut: maintenant UTC)')
    ap.add_argument("--days", type=int, default=30, help="±jours pour bruteforce (défaut: 30)")
    ap.add_argument("--quiet", action="store_true", help="ne pas afficher d’aperçu")
    args = ap.parse_args()

    data = open(args.input, "rb").read()

    if args.seed is not None:
        plain = decrypt_with_seed(data, args.seed, offset=0)
        open(args.output, "wb").write(plain)
        m = PAT_FLAG.search(plain)
        if not args.quiet:
            if m:
                print("FLAG:", m.group(0).decode(errors="ignore"))
            else:
                print("Flag non détecté automatiquement. Fichier écrit:", args.output)
        return

    if args.seed_from_file:
        if len(data) < 4:
            print("Fichier trop court pour contenir une seed en tête.", file=sys.stderr)
            sys.exit(1)
        seed = int.from_bytes(data[:4], "little", signed=False)
        if not args.quiet:
            print(f"Seed lue dans le fichier (LE): {seed}")
        plain = decrypt_with_seed(data, seed, offset=4)
        open(args.output, "wb").write(plain)
        m = PAT_FLAG.search(plain)
        if not args.quiet:
            if m:
                print("FLAG:", m.group(0).decode(errors="ignore"))
            else:
                print("Flag non détecté automatiquement. Fichier écrit:", args.output)
        return

    if args.bruteforce:
        center = int(time.time()) if not args.center else parse_center(args.center)
        span = args.days * 86400
        start, end = center - span, center + span
        if not args.quiet:
            print(f"Bruteforce seeds from {time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(start))} "
                  f"to {time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(end))} (UTC)")

        for seed in range(start, end + 1):
            plain = decrypt_with_seed(data, seed, offset=0)
            m = PAT_FLAG.search(plain)
            if m:
                open(args.output, "wb").write(plain)
                if not args.quiet:
                    print(f"[+] FLAG trouvé avec seed={seed} ({time.strftime('%Y-%m-%d %H:%M:%S', time.gmtime(seed))} UTC)")
                    print("FLAG:", m.group(0).decode(errors="ignore"))
                return

        print("Aucun résultat dans la fenêtre choisie. Ajuste --center/--days.", file=sys.stderr)
        sys.exit(2)

if __name__ == "__main__":
    main()
    
```


```bash 
python3 decrypt.py -i flag.enc --seed-from-file
Seed lue dans le fichier (LE): 1655780698
FLAG: HTB{vRy_s1MplE_F1LE3nCryp0r}
```

