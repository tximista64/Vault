
# Assembly Language - Cheat Sheet

**tags**: #cheatsheet #assembly #x86_64 #gdb #reverse #asm

---

## Registers (64-bit / 8-bit)

| Usage                       | 64-bit  | 8-bit |
|-----------------------------|---------|-------|
| Syscall Number / Return     | `rax`   | `al`  |
| Callee Saved                | `rbx`   | `bl`  |
| 1st arg                     | `rdi`   | `dil` |
| 2nd arg                     | `rsi`   | `sil` |
| 3rd arg                     | `rdx`   | `dl`  |
| 4th arg / Loop Counter      | `rcx`   | `cl`  |
| 5th arg                     | `r8`    | `r8b` |
| 6th arg                     | `r9`    | `r9b` |
| Base Stack Pointer          | `rbp`   | `bpl` |
| Stack Pointer               | `rsp`   | `spl` |
| Instruction Pointer         | `rip`   | —     |

---

## Assembly & Disassembly

| Command                                         | Description                         |
|--------------------------------------------------|-------------------------------------|
| `nasm -f elf64 file.s`                         | Assemble le fichier source          |
| `ld -o prog prog.o`                            | Link de l’objet                     |
| `ld -o prog prog.o -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2` | Link avec libc      |
| `objdump -M intel -d prog`                     | Désassemble la section .text        |
| `objdump -sj .data prog`                       | Affiche le contenu de .data         |

---

## GDB

| Command                       | Description                              |
|-------------------------------|------------------------------------------|
| `gdb -q ./prog`              | Démarre GDB                              |
| `info functions`             | Liste les fonctions                      |
| `disas _start`               | Désassemble une fonction                 |
| `b _start`, `b *0xaddr`      | Breakpoint                               |
| `r`, `c`                     | Run / Continue                           |
| `si`, `ni`, `s`              | Step instruction / into / over           |
| `x/4xg $rip`                 | Examine la mémoire                       |
| `set $rdx=0x9`               | Modifie la valeur d’un registre          |
| `patch string 0xADDR "..."` | Patch mémoire                            |

---

## Instructions - Mouvement

| Instr  | Description                          | Exemple                       |
|--------|--------------------------------------|-------------------------------|
| `mov`  | Déplacer des données                 | `mov rax, 1`                  |
| `lea`  | Charger une adresse effective        | `lea rax, [rsp+5]`            |
| `xchg` | Échanger valeurs entre deux registres| `xchg rax, rbx`               |

---

## Instructions - Arithmétique

**Unaire :**

| Instr | Description         | Exemple         |
|-------|---------------------|-----------------|
| `inc` | Incrémente de 1     | `inc rax`       |
| `dec` | Décrémente de 1     | `dec rax`       |

**Binaire :**

| Instr  | Description                         | Exemple            |
|--------|-------------------------------------|--------------------|
| `add`  | Addition                             | `add rax, rbx`     |
| `sub`  | Soustraction                         | `sub rax, rbx`     |
| `imul` | Multiplication                       | `imul rax, rbx`    |

**Bitwise :**

| Instr | Description      | Exemple           |
|-------|------------------|-------------------|
| `not` | Inversion binaire| `not rax`         |
| `and` | ET binaire       | `and rax, rbx`    |
| `or`  | OU binaire       | `or rax, rbx`     |
| `xor` | XOR binaire      | `xor rax, rbx`    |

---

## Boucles

| Instruction        | Description                          |
|--------------------|--------------------------------------|
| `mov rcx, N`       | Initialise compteur boucle           |
| `loop <label>`     | Décrément rcx et saute si ≠ 0        |

---

## Branching / Conditions

| Instr | Condition                        |
|-------|----------------------------------|
| `jmp` | Saut inconditionnel              |
| `jz`  | Si zéro                          |
| `jnz` | Si non zéro                      |
| `js`  | Si signe négatif                 |
| `jns` | Si signe non négatif             |
| `jg`  | Si >                             |
| `jge` | Si >=                            |
| `jl`  | Si <                             |
| `jle` | Si <=                            |
| `cmp` | Compare deux opérandes           |

---

## Stack

| Instruction | Description                                |
|-------------|--------------------------------------------|
| `push rax`  | Empile la valeur de rax                    |
| `pop rax`   | Dépile et met dans rax                     |

---

## Fonctions

| Instruction | Description                                |
|-------------|--------------------------------------------|
| `call foo`  | Appelle une fonction et empile rip         |
| `ret`       | Dépile rip et saute                        |

---

## Syscall (x86_64)

1. `rax` : numéro du syscall  
2. `rdi`, `rsi`, `rdx`, `r10`, `r8`, `r9` : arguments  
3. `syscall` : exécute le syscall

---

## Shellcoding

| Outil / Commande                                        | Description                            |
|----------------------------------------------------------|----------------------------------------|
| `pwn asm 'push rax' -c amd64`                           | Instruction vers shellcode             |
| `pwn disasm '50' -c amd64`                              | Shellcode hex vers instruction         |
| `python3 shellcoder.py helloworld`                      | Extraire shellcode                     |
| `python3 loader.py '4831c0...0f05'`                     | Lancer du shellcode brut               |
| `python assembler.py '4831...0f05'`                     | Assembler shellcode vers binaire       |

---

## Shellcraft (pwntools)

| Commande                                      | Description                            |
|-----------------------------------------------|----------------------------------------|
| `pwn shellcraft -l amd64.linux`              | Liste les shellcodes disponibles       |
| `pwn shellcraft amd64.linux.sh`              | Génère un shellcode                    |
| `pwn shellcraft amd64.linux.sh -r`           | Lancer le shellcode                    |

---

## Msfvenom

| Commande                                                                      | Description                   |
|--------------------------------------------------------------------------------|-------------------------------|
| `msfvenom -l payloads | grep linux/x64`                                       | Liste des payloads            |
| `msfvenom -p linux/x64/exec CMD=sh -f hex`                                    | Shellcode exec simple         |
| `msfvenom -p linux/x64/exec CMD=sh -f hex -e x64/xor`                         | Shellcode encodé (XOR)        |

---

## Bonnes pratiques Shellcode

1. Pas de variables
2. Pas d’accès mémoire direct
3. Pas de `\x00` (NULL bytes)

---
