---
tags:
  - rust
  - toolchain
  - cargo
  - course/misc
---
# Rust — Toolchain, Cargo et Écosystème

---

## 1. Vue d'ensemble

Rust est un langage compilé qui sort une nouvelle version toutes les **6 semaines**.
Pour gérer ça proprement, l'écosystème repose sur deux outils principaux :

| Outil | Rôle |
|---|---|
| `rustup` | Gère Rust lui-même (versions, composants, cibles) |
| `cargo` | Gère ton projet (build, dépendances, tests, doc) |

Règle simple : **rustup gère Rust, cargo gère ton projet.**

---

## 2. Rustup

### 2.1 C'est quoi

Rustup est le **gestionnaire de toolchains**. Une toolchain c'est un ensemble :
- `rustc` — le compilateur
- `cargo` — le build tool
- la stdlib
- les composants optionnels (rustfmt, clippy, rust-analyzer...)

### 2.2 Les canaux

```
stable   → version courante recommandée (mise à jour toutes les 6 semaines)
beta     → prochaine stable en test
nightly  → build quotidien, fonctionnalités expérimentales
```

### 2.3 Commandes essentielles

```bash
# Mise à jour
rustup update

# État de l'installation
rustup show

# Gérer les toolchains
rustup toolchain list
rustup toolchain install nightly
rustup toolchain install 1.70.0
rustup default stable                  # toolchain par défaut
rustup override set nightly            # force nightly pour le dossier courant uniquement

# Composants (outils additionnels)
rustup component add rustfmt           # formateur de code
rustup component add clippy            # linter / analyse statique
rustup component add rust-analyzer     # LSP pour l'éditeur
rustup component add rust-src          # sources de la stdlib

# Cibles de compilation (cross-compilation)
rustup target list --installed
rustup target add wasm32-unknown-unknown
rustup target add x86_64-pc-windows-gnu
rustup target add x86_64-unknown-linux-musl
```

### 2.4 Variables d'environnement importantes

```bash
RUSTUP_HOME=/usr/local/rustup   # où rustup stocke les toolchains
CARGO_HOME=/usr/local/cargo     # où cargo stocke ses binaires et le cache
PATH=$CARGO_HOME/bin:$PATH      # pour avoir cargo, rustc, etc. dans le PATH
```

Ces variables doivent être **explicitement définies** pour les utilisateurs non-root
(l'image Docker officielle `rust:latest` les définit pour root uniquement).

---

## 3. Cargo

### 3.1 C'est quoi

Cargo est à la fois :
- Un **gestionnaire de dépendances** (comme npm, pip)
- Un **build system**
- Un **runner de tests**
- Un **générateur de documentation**

### 3.2 Créer un projet

```bash
cargo new mon_projet          # binaire → src/main.rs
cargo new ma_lib --lib        # bibliothèque → src/lib.rs
cargo init                    # initialise dans le dossier courant
```

Structure générée :

```
mon_projet/
├── Cargo.toml      ← manifeste du projet
├── Cargo.lock      ← versions exactes résolues (ne pas éditer à la main)
└── src/
    └── main.rs
```

### 3.3 Cargo.toml

```toml
[package]
name = "mon_projet"
version = "0.1.0"
edition = "2021"

[dependencies]
serde = { version = "1.0", features = ["derive"] }
tokio = { version = "1", features = ["full"] }
reqwest = "0.11"

[dev-dependencies]
# dépendances utilisées uniquement pour les tests
criterion = "0.5"
```

### 3.4 Commandes du quotidien

```bash
# Vérification et compilation
cargo check                  # vérifie sans produire de binaire (rapide)
cargo build                  # compile en debug
cargo build --release        # compile en release (optimisé)

# Exécution
cargo run                    # compile + exécute
cargo run -- arg1 arg2       # avec arguments passés au binaire

# Tests
cargo test                   # tous les tests
cargo test nom_du_test       # un test spécifique
cargo test -- --nocapture    # affiche les println! pendant les tests

# Qualité
cargo fmt                    # formate le code (rustfmt)
cargo clippy                 # analyse statique, suggestions

# Documentation
cargo doc                    # génère la doc
cargo doc --open             # génère et ouvre dans le navigateur

# Nettoyage
cargo clean                  # supprime target/ (récupère de l'espace disque)
```

### 3.5 Gérer les dépendances

Les dépendances viennent de **crates.io** (le registry officiel).

```bash
cargo add serde                        # ajoute la dernière version
cargo add serde --features derive      # avec features spécifiques
cargo add tokio@1.0                    # version précise
cargo add --dev criterion              # dépendance de dev uniquement
cargo remove serde                     # supprime
cargo update                           # met à jour dans les contraintes du Cargo.toml
```

### 3.6 Installer des outils

`cargo install` compile et installe des **binaires tiers** dans `$CARGO_HOME/bin/`.
Ce n'est pas pour les dépendances d'un projet, c'est pour des outils globaux.

```bash
cargo install cargo-watch    # relance cargo run à chaque modification
cargo install cargo-expand   # affiche l'expansion des macros
cargo install cargo-audit    # audit de sécurité des dépendances
cargo install sqlx-cli        # outil CLI pour sqlx
```

### 3.7 Le dossier target/

Cargo compile tout dans `target/`. Il peut facilement peser **plusieurs Go**.

```
target/
├── debug/          ← binaires et artefacts debug
├── release/        ← binaires et artefacts release
└── ...             ← cache de compilation intermédiaire
```

Ne jamais commiter `target/` — l'ajouter au `.gitignore`.

---

## 4. Compiler un binaire exécutable

### 4.1 Debug vs Release

```bash
cargo build           # debug   → target/debug/nom_projet
cargo build --release # release → target/release/nom_projet
```

| | Debug | Release |
|---|---|---|
| Vitesse de compilation | Rapide | Lente |
| Vitesse d'exécution | Lente | Optimisée |
| Symboles de debug | Oui | Non |
| Usage | Développement | Distribution |

La différence de performance à l'exécution peut être **x10 à x100**.

### 4.2 Cross-compilation

Compiler depuis Linux pour une autre cible :

```bash
# Windows
rustup target add x86_64-pc-windows-gnu
cargo build --release --target x86_64-pc-windows-gnu
# → target/x86_64-pc-windows-gnu/release/nom_projet.exe

# WebAssembly
rustup target add wasm32-unknown-unknown
cargo build --release --target wasm32-unknown-unknown

# Binaire Linux 100% statique (musl)
rustup target add x86_64-unknown-linux-musl
cargo build --release --target x86_64-unknown-linux-musl
```

### 4.3 Statique vs dynamique

Par défaut, Rust lie **statiquement** sa stdlib mais **dynamiquement** la libc système (glibc).

Avec la cible `musl`, le binaire est **100% statique** : aucune dépendance système,
tu le copies où tu veux et il tourne (Alpine, Debian, CentOS, peu importe).

---

## 5. Les macros

### 5.1 Macro vs fonction

Une fonction accepte un nombre fixe de paramètres d'un type défini.
Une **macro** (identifiable au `!`) génère du code à la **compilation** avant que rustc compile quoi que ce soit.

```rust
println!("valeur: {}", x);
// devient à la compilation quelque chose comme :
std::io::stdout().write_fmt(format_args!("valeur: {}\n", x));
```

### 5.2 Pourquoi certaines choses sont des macros

| Macro | Raison |
|---|---|
| `println!` | Nombre et types d'arguments variables |
| `vec![1, 2, 3]` | Syntaxe littérale impossible en fonction |
| `panic!` | Doit capturer le fichier et la ligne source |
| `assert_eq!` | Doit afficher les deux valeurs en cas d'échec |
| `dbg!` | Doit connaître le nom de la variable à la compilation |
| `format!` | Même raison que println! |

### 5.3 Voir l'expansion d'une macro

```bash
cargo install cargo-expand
cargo expand             # affiche le code généré par toutes les macros du projet
```

---

## 6. Environnement Docker pour le dev

### 6.1 Pourquoi Docker pour du dev Rust

- Environnement **reproductible** et **isolé** du système hôte
- Même setup sur toutes les machines (versions, outils, config éditeur)
- Pas de pollution de l'hôte avec différentes versions de cargo/node/etc.
- Environnement **jetable** : un projet foireux → `docker compose down`

### 6.2 Points critiques dans un Dockerfile Rust

L'image officielle `rust:latest` définit `RUSTUP_HOME` et `CARGO_HOME` pour **root**.
Pour un utilisateur non-root, ces variables doivent être redéclarées explicitement :

```dockerfile
ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
```

Sans ça, rustup cherche dans `~/.cargo` et `~/.rustup` (home de l'utilisateur),
mais les binaires et toolchains sont dans `/usr/local/` → erreur au `rustup update`.

### 6.3 Commandes Docker utiles

```bash
docker compose up -d              # démarre le conteneur en arrière-plan
docker compose exec rust-dev zsh  # ouvre un shell dans le conteneur
docker compose down               # arrête et supprime le conteneur
docker compose build --no-cache   # rebuild complet de l'image
```

---

## 7. Récapitulatif de l'architecture

```
rustup
  └── gère les toolchains
        └── chaque toolchain contient
              ├── rustc          ← le vrai compilateur
              ├── cargo          ← appelé par toi
              ├── rustfmt        ← cargo fmt
              ├── clippy         ← cargo clippy
              └── rust-analyzer  ← LSP éditeur

cargo
  └── orchestre le projet
        ├── lit Cargo.toml
        ├── résout les dépendances (crates.io)
        ├── télécharge et compile les dépendances
        └── appelle rustc pour compiler ton code

crates.io
  └── registry des bibliothèques Rust (équivalent npmjs.com)
```

---

## 8. Antisèche rapide

```bash
# Setup
rustup update
rustup component add rustfmt clippy rust-analyzer

# Nouveau projet
cargo new mon_projet && cd mon_projet

# Cycle de dev
cargo check          # vérification rapide
cargo run            # compile + exécute
cargo fmt            # formate
cargo clippy         # analyse

# Tests
cargo test

# Distribuer
cargo build --release
# binaire dans target/release/nom_projet

# Binaire 100% statique
rustup target add x86_64-unknown-linux-musl
cargo build --release --target x86_64-unknown-linux-musl
```
