#!/usr/bin/env python3
"""
decrypt.py - dechiffre le canal C2 du challenge Ash-Binder

    pip install scapy pycryptodome
    python3 decrypt.py [chemin/vers/capture.pcap]

Fonctionne avec n'importe quelle version de Python 3 : le dechiffrement
n'a pas la contrainte de version qui pese sur la lecture du .pyc.
"""
import base64, hashlib, struct, sys
from scapy.all import rdpcap, TCP
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad

PCAP = sys.argv[1] if len(sys.argv) > 1 else 'capture.pcap'
PORT = 443
KEY  = 'ZQLJlA8BYg0iy1qFH0PwpB8tn8Y2DX0j'   # constante en dur dans client.pyc

# derivation : master -> enc_key (fonction Fg3hY6 du binaire)
m  = hashlib.sha256(KEY.encode()).digest()
ek = hashlib.sha256(m + b'encryption').digest()[:32]
hk = hashlib.sha256(m + b'hmac').digest()[:32]

print(f"cle maitre  {KEY}")
print(f"enc_key     {ek.hex()}")
print(f"md5(octets) {hashlib.md5(ek).hexdigest()}\n")

# reassemblage des deux sens du flux TCP
bufs = {'victime->attaquant': b'', 'attaquant->victime': b''}
for p in rdpcap(PCAP):
    if TCP in p and PORT in (p[TCP].sport, p[TCP].dport):
        pl = bytes(p[TCP].payload)
        if pl:
            sens = 'victime->attaquant' if p[TCP].dport == PORT else 'attaquant->victime'
            bufs[sens] += pl

# framing [uint32 BE longueur][base64(IV | ciphertext | tag)]
total = ok_count = 0
for sens, buf in bufs.items():
    print(f"--- {sens} ---")
    i = 0
    while i + 4 <= len(buf):
        n = struct.unpack('>I', buf[i:i+4])[0]
        if n == 0 or n > len(buf) - i - 4:
            break
        raw = base64.b64decode(buf[i+4:i+4+n])
        i += 4 + n
        iv, ct, tag = raw[:16], raw[16:-32], raw[-32:]
        valide = hashlib.new('sha256', hk + iv + ct).digest() == tag
        pt = unpad(AES.new(ek, AES.MODE_CBC, iv).decrypt(ct), 16)
        total += 1
        ok_count += valide
        print(('' if valide else '[TAG INVALIDE] ') + pt.decode(errors='replace'))

        # decodage des charges base64 imbriquees (DWNL_DATA, UPLD_DATA, payload gzip)
        for tok in pt.decode(errors='replace').split():
            tok = tok.strip("'\"`,;|")
            if len(tok) < 40:
                continue
            try:
                d = base64.b64decode(tok, validate=True)
            except Exception:
                continue
            if d[:2] == b'\x1f\x8b':
                import gzip
                try:
                    d = gzip.decompress(d)
                except OSError:
                    continue
            try:
                for line in d.decode().splitlines():
                    print(f"    | {line}")
            except UnicodeDecodeError:
                print(f"    | <binaire, {len(d)} octets>")
    print()

print(f"{ok_count}/{total} tags valides")
