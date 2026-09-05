---
tags:
  - python
  - scripting
  - course/htb-academy
---

# Managing Libraries – Virtual Environments

## Localisation des packages

Python installe les packages tiers dans un répertoire dédié :
- `site-packages` (Windows)
- `dist-packages` (Debian/Ubuntu)

Le chemin de recherche des modules est consultable via `sys.path` et peut être étendu avec la variable d'environnement `PYTHONPATH`.

## Virtual environments (`venv`)

Un **venv** est un environnement Python isolé avec son propre binaire et ses propres packages — évite les conflits de versions entre projets.

```bash
# Créer un environnement
python3 -m venv mon_env

# L'activer
source mon_env/bin/activate

# Désactiver
deactivate
```

En pentest : utiliser un venv par projet/outil pour éviter qu'une dépendance casse un autre outil.

## Points de vigilance

- **`PYTHONPATH`** : utile en dev, mais risque de sécurité — si un attaquant contrôle cette variable, il peut forcer le chargement d'un package malveillant à la place du légitime.
- Pour des projets plus larges ou en production : préférer **Docker** ou **Conda** à `venv`.
