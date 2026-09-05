# Web Requests - Cheat Sheet

**tags**: #cheatsheet #web #curl #http #api #requests

---

## cURL - Commandes de base

| Command                                                                 | Description                                       |
|-------------------------------------------------------------------------|---------------------------------------------------|
| `curl -h`                                                               | Aide cURL                                         |
| `curl inlanefreight.com`                                               | Requête GET simple                                |
| `curl -s -O inlanefreight.com/index.html`                              | Télécharge un fichier                             |
| `curl -k https://inlanefreight.com`                                    | Ignore la vérification SSL                        |
| `curl inlanefreight.com -v`                                            | Affiche tous les détails HTTP                     |
| `curl -I https://www.inlanefreight.com`                                | Requête HEAD uniquement (entêtes)                 |
| `curl -i https://www.inlanefreight.com`                                | Affiche entêtes et corps de la réponse            |
| `curl https://www.inlanefreight.com -A 'Mozilla/5.0'`                  | Spécifie l’User-Agent                             |
| `curl -u admin:admin http://<SERVER_IP>:<PORT>/`                       | Authentification HTTP basique                     |
| `curl http://admin:admin@<SERVER_IP>:<PORT>/`                          | Authentification HTTP dans l’URL                  |

---

## cURL - Requêtes personnalisées

| Command                                                                 | Description                                           |
|-------------------------------------------------------------------------|-------------------------------------------------------|
| `curl -H 'Authorization: Basic YWRtaW46YWRtaW4=' http://<IP>:<PORT>/`  | Ajoute un en-tête personnalisé (authentification)     |
| `curl 'http://<IP>:<PORT>/search.php?search=le'`                       | Envoie des paramètres en GET                         |
| `curl -X POST -d 'username=admin&password=admin' http://<IP>:<PORT>/` | Requête POST avec données encodées URL               |
| `curl -b 'PHPSESSID=sessionid' http://<IP>:<PORT>/`                    | Envoie un cookie                                      |
| `curl -X POST -d '{"search":"london"}' -H 'Content-Type: application/json' http://<IP>:<PORT>/search.php` | Requête POST avec JSON |

---

## API - RESTful Interactions

| Command                                                                                                   | Description         |
|-----------------------------------------------------------------------------------------------------------|---------------------|
| `curl http://<IP>:<PORT>/api.php/city/london`                                                            | Lire une entrée     |
| `curl -s http://<IP>:<PORT>/api.php/city/ \| jq`                                                         | Lire toutes les entrées |
| `curl -X POST http://<IP>:<PORT>/api.php/city/ -d '{"city_name":"HTB_City","country_name":"HTB"}' -H 'Content-Type: application/json'` | Créer une entrée     |
| `curl -X PUT http://<IP>:<PORT>/api.php/city/london -d '{"city_name":"New_HTB_City","country_name":"HTB"}' -H 'Content-Type: application/json'` | Modifier une entrée |
| `curl -X DELETE http://<IP>:<PORT>/api.php/city/New_HTB_City`                                            | Supprimer une entrée |

---

## Raccourcis navigateur (DevTools)

| Raccourci               | Description               |
|-------------------------|---------------------------|
| `Ctrl+Shift+I` ou `F12` | Ouvrir les outils dev     |
| `Ctrl+Shift+E`          | Onglet réseau             |
| `Ctrl+Shift+K`          | Console JavaScript        |

---

