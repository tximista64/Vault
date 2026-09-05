---
tags:
  - penetration-testing
  - web-application-security
  - course/htb-academy
---

# Test d’Applications Web
Les tests d'intrusion sur les applications web constituent un domaine spécialisé de la cybersécurité, axé sur l'identification et l'exploitation des vulnérabilités dans les applications web. Contrairement aux tests d'intrusion réseau traditionnels, le pentest d'applications web nécessite une compréhension approfondie du fonctionnement des applications web, notamment les interactions client-serveur, les protocoles web et les technologies web courantes.
## Architecture des applications web
Les applications web suivent généralement une architecture en trois niveaux :
- Couche de présentation (frontend)
- Couche applicative (backend)
- Couche base de données
Pour devenir compétent en test d'intrusion d'applications web, il faut maîtriser plusieurs technologies et concepts clés : protocoles HTTP/HTTPS, HTML, CSS, JavaScript pour l’analyse frontend, langages serveur comme PHP, Python ou Java, ainsi que les bases de données SQL et NoSQL. Comprendre les interactions entre ces composants est essentiel pour repérer les failles de sécurité.
## Vulnérabilités courantes
Voici quelques-unes des vulnérabilités les plus critiques :
- Injections (SQL, Command Injection...)
- Failles d'authentification et de gestion de session
- Cross-Site Scripting (XSS)
Les injections SQL sont parmi les vulnérabilités les plus graves : elles apparaissent lorsqu'une application ne filtre pas correctement les entrées utilisateur dans les requêtes SQL. De même, les Command Injections permettent potentiellement à un attaquant d’exécuter des commandes système sur le serveur.
Les faiblesses dans les systèmes d'authentification peuvent entraîner des accès non autorisés : politiques de mot de passe trop faibles, mauvaise gestion des tokens de session, contournement de l’authentification, etc.
Les failles XSS permettent d’injecter du code malveillant côté navigateur. Mal filtrées, les données affichées peuvent compromettre les sessions ou permettre le vol d’identifiants.
## Compétences et outils indispensables
Pour réussir un test d’application web, il faut maîtriser plusieurs outils clés. Les proxys comme Burp Suite (Pro) ou OWASP ZAP permettent d’intercepter et d’analyser le trafic web. Les outils développeur intégrés aux navigateurs sont cruciaux pour comprendre le comportement du frontend.
La connaissance des langages de script comme Python est également précieuse pour automatiser des tests ou créer des outils personnalisés.
[[Burpsuite-Intercept.gif]]
## Aspects légaux et éthiques
Les tests doivent toujours être effectués dans un cadre légal et éthique strict. Il est impératif d’avoir une autorisation explicite pour tester l’application cible, de respecter les limites de périmètre, et de ne pas nuire au service ou à ses utilisateurs. Il faut également respecter les procédures de divulgation responsable.
Enfin, le but n’est pas seulement de trouver des vulnérabilités : il s’agit d’aider les organisations à renforcer leur posture de sécurité. Un bon pentester identifie les problèmes, mais fournit aussi des recommandations concrètes pour les corriger et prévenir leur réapparition.
