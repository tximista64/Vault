---
tags:
  - lfi
  - rfi
  - web-security
  - course/lets-defend
---

# Detecting RFI & LFI Attacks


### Résumé : Détection des attaques LFI & RFI

### Qu'est-ce que le **Local File Inclusion (LFI)** ?

Le **Local File Inclusion (LFI)** est une vulnérabilité de sécurité où un fichier est inclus dans une application web sans que les données reçues de l'utilisateur ne soient correctement validées. Contrairement à RFI, le fichier inclus se trouve sur le même serveur que l'application web. Un attaquant peut exploiter cette vulnérabilité pour accéder à des fichiers sensibles sur le serveur, comme des fichiers contenant des mots de passe.

### Qu'est-ce que le **Remote File Inclusion (RFI)** ?

Le **Remote File Inclusion (RFI)** est une vulnérabilité où un fichier est inclus sans validation, mais dans ce cas, le fichier est hébergé sur un serveur externe. Les attaquants exploitent cette vulnérabilité pour inciter les victimes à exécuter du code malveillant provenant de serveurs distants qu'ils ont préparés.

### Comment fonctionnent les attaques LFI & RFI ?

Les attaques LFI et RFI se produisent lorsque les données reçues de l'utilisateur ne sont pas correctement validées et sont utilisées pour inclure des fichiers, soit localement, soit à distance. Les applications web modernes permettent souvent de spécifier des paramètres, comme la langue, qui peuvent être manipulés par les attaquants pour inclure des fichiers sensibles.

### Résumé des pratiques de mitigation :

- **Valider et filtrer toutes les entrées utilisateur.**
- **Désactiver l'inclusion de fichiers distants et restreindre l'accès aux fichiers locaux sensibles.**
- **Limiter les chemins de fichiers et utiliser des chemins absolus.**
- **Restreindre les permissions d'accès aux fichiers sensibles.**
- **Utiliser des outils de surveillance et des en-têtes de sécurité.**
- **Privilégier le développement sécurisé avec des frameworks fiables.**

En appliquant ces bonnes pratiques de sécurité, vous réduisez considérablement les risques liés aux vulnérabilités LFI et RFI dans vos applications web

