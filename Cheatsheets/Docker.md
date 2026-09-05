
# Docker - Cheat Sheet

**tags**: #cheatsheet #docker #devops #containers #linux

---

## Général

| Commande              | Description                                 |
|-----------------------|---------------------------------------------|
| `docker version`     | Affiche la version de Docker                |
| `docker info`        | Infos système et configuration Docker       |
| `docker help`        | Aide générale sur Docker                    |

---

## Images

| Commande                                  | Description                              |
|-------------------------------------------|------------------------------------------|
| `docker pull <image>`                    | Télécharge une image depuis un registre  |
| `docker images`                          | Liste les images locales                 |
| `docker rmi <image>`                     | Supprime une image                       |
| `docker build -t <nom>:<tag> .`          | Construit une image depuis un Dockerfile |
| `docker tag <image> <repo>:<tag>`       | Ajoute un tag à une image                |
| `docker push <repo>:<tag>`              | Envoie une image vers un registre        |

---

## Conteneurs

| Commande                                            | Description                             |
|-----------------------------------------------------|-----------------------------------------|
| `docker run <image>`                               | Lance un conteneur                      |
| `docker run -it <image> bash`                      | Lance un conteneur interactif           |
| `docker run -d --name <nom> <image>`               | Lance un conteneur en arrière-plan      |
| `docker start <nom>` / `docker stop <nom>`         | Démarre / Arrête un conteneur           |
| `docker restart <nom>` / `docker rm <nom>`         | Redémarre / Supprime un conteneur       |
| `docker ps` / `docker ps -a`                       | Liste les conteneurs actifs / tous      |
| `docker exec -it <nom> bash`                       | Ouvre un shell dans un conteneur        |
| `docker logs <nom>`                                | Affiche les logs du conteneur           |
| `docker inspect <nom>`                             | Affiche les détails du conteneur        |
| `docker cp <nom>:/src /dst`                        | Copie un fichier du conteneur à l’hôte  |
| `docker cp /src <nom>:/dst`                        | Copie un fichier de l’hôte au conteneur |

---

## Réseaux

| Commande                                     | Description                                 |
|----------------------------------------------|---------------------------------------------|
| `docker network ls`                         | Liste les réseaux Docker                    |
| `docker network create <nom>`               | Crée un réseau personnalisé                 |
| `docker network connect <net> <container>`  | Connecte un conteneur à un réseau           |
| `docker network inspect <nom>`              | Affiche les détails d’un réseau             |

---

## Volumes

| Commande                              | Description                                    |
|---------------------------------------|------------------------------------------------|
| `docker volume ls`                   | Liste les volumes                              |
| `docker volume create <nom>`         | Crée un volume                                 |
| `docker volume inspect <nom>`        | Affiche les détails d’un volume                |
| `docker volume rm <nom>`             | Supprime un volume                             |
| `docker run -v <volume>:/path image` | Monte un volume dans un conteneur              |

---

## Dockerfile - Extrait minimal

```dockerfile
FROM ubuntu
RUN apt update && apt install -y curl
COPY . /app
WORKDIR /app
CMD ["./start.sh"]
```

---

## Nettoyage

| Commande                    | Description                                      |
|-----------------------------|--------------------------------------------------|
| `docker system prune`      | Supprime tous les objets inutilisés              |
| `docker image prune`       | Supprime les images non utilisées                |
| `docker container prune`   | Supprime les conteneurs arrêtés                  |
| `docker volume prune`      | Supprime les volumes non utilisés                |

---

## Divers / Astuces

| Commande                                         | Description                                  |
|--------------------------------------------------|----------------------------------------------|
| `docker stats`                                  | Affiche l’usage des ressources               |
| `docker top <nom>`                              | Liste les processus d’un conteneur           |
| `docker export <nom> > backup.tar`              | Exporte un conteneur en tar (pas une image)  |
| `cat backup.tar \| docker import - image-name`  | Importe un conteneur exporté                 |
| `docker save <image> > image.tar`               | Sauvegarde une image                         |
| `docker load < image.tar`                       | Charge une image depuis un fichier           |
| `docker run --rm -it alpine sh`                 | Lance un conteneur temporaire pour debug     |
| `-v $(pwd)/config:/app/config`                  | Monte un fichier ou dossier dans le conteneur |

---
