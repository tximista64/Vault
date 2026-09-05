---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Managing Libraries in Python

**pip** ("pip installs packages") est le gestionnaire de packages Python standard. Il permet d'installer, mettre à jour et désinstaller des packages externes.

## Commandes essentielles

```bash
# Installer un package
python3 -m pip install flask

# Mettre à jour
python3 -m pip install --upgrade flask

# Désinstaller
pip uninstall flask

# Lister les packages installés (avec versions)
python3 -m pip freeze
```

L'installation d'un package installe automatiquement ses **dépendances**.

## requirements.txt

Fichier listant les packages nécessaires à un projet — pratique pour partager l'environnement.

```
flask
click
flask==1.1.2      # version exacte
xyz>=1.0.5        # version minimale
```

Installation depuis le fichier :

```bash
python3 -m pip install -r requirements.txt
```

## Opérateurs de version (PEP 440)

| Opérateur | Signification |
|-----------|---------------|
| `==`      | Version exacte |
| `<=` / `>=` | Inférieur ou égal / supérieur ou égal |
| `<` / `>`  | Strictement inférieur / supérieur |

Utile pour exclure des versions vulnérables (`xyz>=1.0.5`) ou figer une version stable quand une mise à jour casse le code existant.
