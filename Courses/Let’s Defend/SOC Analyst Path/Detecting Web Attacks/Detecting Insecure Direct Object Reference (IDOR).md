---
tags:
  - idor
  - web-security
  - access-control
  - course/lets-defend
---

# Detecting Insecure Direct Object Reference (IDOR) Attacks


### Résumé : Détection des attaques par Insecure Direct Object Reference (IDOR)

**Qu'est-ce qu'un IDOR ?**

L'Insecure Direct Object Reference (IDOR) est une vulnérabilité de sécurité qui se produit lorsqu'un mécanisme d'autorisation est absent ou mal utilisé. Elle permet à un attaquant d'accéder à un objet qui ne lui appartient pas. Cela relève de la catégorie des contrôles d'accès défectueux (Broken Access Control) et figure parmi les vulnérabilités web les plus critiques, classées par l'OWASP en 2021.

**Comment fonctionne l'IDOR ?**

L'IDOR ne résulte pas d'une mauvaise validation des données, comme d'autres vulnérabilités web. L'attaquant manipule simplement les paramètres envoyés à l'application web, accède à des objets non autorisés, puis peut lire, modifier ou supprimer des données.

Par exemple, une URL qui demande des informations avec un paramètre `id` peut être manipulée (par exemple, changer `id=1` en `id=2`) pour accéder aux informations d'autres utilisateurs si l'application ne vérifie pas l'autorisation de l'utilisateur qui effectue la demande.

**Exploitation des vulnérabilités IDOR :**

Les attaquants peuvent voler des informations personnelles, accéder à des documents non autorisés, ou même effectuer des actions comme la suppression ou la modification de données. Les paramètres vulnérables incluent souvent des identifiants d'utilisateur ou des informations sensibles qui ne sont pas correctement protégées.

**Prévention des attaques IDOR :**

Il est crucial de toujours vérifier que l'utilisateur est autorisé à accéder à l'objet demandé. Par exemple, il est préférable de ne pas exposer des paramètres comme `id` directement dans les URLs et d'utiliser plutôt des informations de session pour identifier l'utilisateur. De plus, il faut minimiser les paramètres nécessaires pour éviter d'exposer trop d'informations.

**Détection des attaques IDOR :**

Les attaques IDOR sont plus difficiles à détecter que d'autres types d'attaques comme l'injection SQL ou le XSS, car elles ne génèrent pas de charges utiles spécifiques. Voici quelques méthodes pour les identifier :

- **Vérifier tous les paramètres** : Un IDOR peut se produire avec n'importe quel paramètre. Il est donc important de vérifier tous les paramètres dans les requêtes.
- **Observer les requêtes multiples** : Les attaquants essaient souvent d'accéder à l'information de plusieurs utilisateurs en effectuant des attaques par force brute, générant ainsi de nombreuses requêtes vers la même page.
- **Chercher des motifs** : Les attaques par IDOR impliquent souvent l'accès à des ressources dans un ordre séquentiel (par exemple, `id=1`, `id=2`, `id=3`), ce qui peut indiquer une tentative d'exploitation.

**Exemple de détection d'attaque IDOR :**

Un exemple concret montre comment une analyse des journaux d'accès d'un serveur WordPress a permis de détecter une attaque IDOR. Le même paramètre `user_id` apparaissant dans plusieurs requêtes en un court laps de temps suggérait une attaque automatisée utilisant un outil comme Wfuzz. L'examen des tailles de réponses HTTP a révélé des anomalies, indiquant que l'attaque n'a probablement pas réussi, mais sans les réponses HTTP complètes, la détection reste difficile.

En résumé, les attaques IDOR sont une menace sérieuse qui peut être difficile à détecter, mais une surveillance attentive des paramètres et des motifs dans les requêtes peut aider à identifier et à prévenir ces vulnérabilités.

