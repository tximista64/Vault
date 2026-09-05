---
tags:
  - linux
  - task-scheduling
  - cron
  - systemd
  - course/htb-academy
---
# Task Scheduling

La planification de tâches (`task scheduling`) est une fonctionnalité critique des systèmes Linux qui permet aux utilisateurs et aux administrateurs d'automatiser des tâches en les exécutant à des moments précis ou à intervalles réguliers, éliminant ainsi le besoin d'un déclenchement manuel. Disponible sur des distributions comme Ubuntu, Red Hat Linux et Solaris, cette fonctionnalité gère un large éventail de tâches telles que les mises à jour logicielles automatiques, l'exécution de scripts, la maintenance de bases de données et l'automatisation des sauvegardes (`backup automation`). En planifiant des tâches régulières et répétitives, on s'assure qu'elles sont exécutées de manière cohérente et fiable. De plus, des alertes peuvent être configurées pour notifier les administrateurs ou les utilisateurs lorsque certains événements se produisent. Bien qu'il existe de nombreuses applications pour ce type d'automatisation, ces exemples représentent les cas d'usage les plus courants.

La planification de tâches, de manière générale, s'apparente à programmer une cafetière ou une théière pour qu'elle se mette en marche automatiquement chaque matin. Une fois programmée, elle prépare le café ou le thé à l'heure souhaitée sans intervention supplémentaire, garantissant qu'une tasse fraîche soit prête au moment voulu.

Comprendre la planification de tâches dans les systèmes Linux est essentiel pour nous, en tant que spécialistes en cybersécurité et pentesters, car elle peut servir à la fois d'outil d'administration légitime et de vecteur d'activité malveillante. Connaître le fonctionnement de l'automatisation des tâches permet d'identifier des risques de sécurité potentiels, comme des tâches cron (`cron jobs`) non autorisées qui exécutent des scripts nuisibles ou maintiennent des backdoors persistantes à intervalles programmés. En comprenant les subtilités de la planification de tâches, on peut détecter et analyser ces menaces cachées, renforcer les audits système, et même utiliser des tâches planifiées pour simuler des scénarios d'attaque lors d'un test d'intrusion.

## Systemd

Systemd est un service utilisé sur les systèmes Linux comme Ubuntu, Redhat Linux et Solaris pour démarrer des processus et des scripts à un moment précis. Avec lui, on peut configurer des processus et des scripts pour qu'ils s'exécutent à un moment ou à un intervalle de temps précis, et on peut également spécifier des événements et déclencheurs (`triggers`) spécifiques qui déclencheront une tâche donnée. Pour cela, il faut suivre certaines étapes et précautions avant que nos scripts ou processus ne soient exécutés automatiquement par le système.

- Créer un timer (planifie quand `mytimer.service` doit s'exécuter)
- Créer un service (exécute les commandes ou le script)
- Activer le timer

### Create a Timer

Pour créer un timer pour systemd, il faut créer un répertoire dans lequel le script du timer sera stocké.

```shellsession
Tximista64@htb[/htb]$ sudo mkdir /etc/systemd/system/mytimer.timer.d
Tximista64@htb[/htb]$ sudo vim /etc/systemd/system/mytimer.timer
```

Ensuite, il faut créer un script qui configure le timer. Le script doit contenir les options suivantes : `Unit`, `Timer` et `Install`. L'option `Unit` spécifie une description pour le timer. L'option `Timer` spécifie quand démarrer le timer et quand l'activer. Enfin, l'option `Install` spécifie où installer le timer.

**Mytimer.timer**

```txt
[Unit]
Description=My Timer

[Timer]
OnBootSec=3min
OnUnitActiveSec=1hour

[Install]
WantedBy=timers.target
```

Ici, cela dépend de la manière dont on souhaite utiliser notre script. Par exemple, si on veut exécuter notre script une seule fois après le démarrage du système, on doit utiliser le paramètre `OnBootSec` dans `Timer`. En revanche, si on veut que notre script s'exécute régulièrement, on doit utiliser `OnUnitActiveSec` pour que le système exécute le script à intervalles réguliers. Ensuite, il faut créer notre service.

### Create a Service

```shellsession
Tximista64@htb[/htb]$ sudo vim /etc/systemd/system/mytimer.service
```

Ici, on définit une description et on spécifie le chemin complet vers le script que l'on souhaite exécuter. `multi-user.target` est l'unité système activée au démarrage d'un mode multi-utilisateur normal. Elle définit les services qui doivent être démarrés lors d'un démarrage système normal.

```txt
[Unit]
Description=My Service

[Service]
ExecStart=/full/path/to/my/script.sh

[Install]
WantedBy=multi-user.target
```

Après cela, il faut demander à systemd de relire les dossiers pour prendre en compte les changements.

### Reload Systemd

```shellsession
Tximista64@htb[/htb]$ sudo systemctl daemon-reload
```

Ensuite, on peut utiliser `systemctl` pour démarrer le service manuellement et activer le démarrage automatique.

### Start the Timer & Service

```shellsession
Tximista64@htb[/htb]$ sudo systemctl start mytimer.timer
Tximista64@htb[/htb]$ sudo systemctl enable mytimer.timer
```

Ainsi, `mytimer.service` sera lancé automatiquement selon les intervalles (ou délais) définis dans `mytimer.timer`.

## Cron

Cron est un autre outil utilisable sur les systèmes Linux pour planifier et automatiser des processus. Il permet aux utilisateurs et administrateurs d'exécuter des tâches à un moment précis ou à des intervalles spécifiques. Pour les exemples ci-dessus, on peut également utiliser Cron pour automatiser les mêmes tâches. Il suffit de créer un script puis de dire au démon cron (`cron daemon`) de l'appeler à un moment précis.

Avec Cron, on peut automatiser les mêmes tâches, mais le processus de configuration du démon Cron est un peu différent de celui de Systemd. Pour configurer le démon cron, il faut stocker les tâches dans un fichier appelé `crontab`, puis indiquer au démon quand exécuter les tâches. On peut ensuite planifier et automatiser les tâches en configurant le démon cron en conséquence. La structure de Cron se compose des éléments suivants :

| Time Frame | Description |
|---|---|
| Minutes (0-59) | Indique à quelle minute la tâche doit être exécutée. |
| Hours (0-23) | Indique à quelle heure la tâche doit être exécutée. |
| Days of month (1-31) | Indique quel jour du mois la tâche doit être exécutée. |
| Months (1-12) | Indique quel mois la tâche doit être exécutée. |
| Days of the week (0-7) | Indique quel jour de la semaine la tâche doit être exécutée. |

Par exemple, un tel `crontab` pourrait ressembler à ceci :

```txt
# System Update
0 */6 * * * /path/to/update_software.sh

# Execute Scripts
0 0 1 * * /path/to/scripts/run_scripts.sh

# Cleanup DB
0 0 * * 0 /path/to/scripts/clean_database.sh

# Backups
0 0 * * 7 /path/to/scripts/backup.sh
```

La première tâche, `System Update`, doit être exécutée toutes les six heures. C'est indiqué par l'entrée `0 */6` dans la colonne des heures. La tâche est exécutée par le script `update_software.sh`, dont le chemin est indiqué dans la dernière colonne.

La deuxième tâche, `Execute Scripts`, doit être exécutée le premier jour de chaque mois à minuit. C'est indiqué par les entrées `0` et `0` dans les colonnes des minutes et des heures, et `1` dans la colonne du jour du mois. La tâche est exécutée par le script `run_scripts.sh`, dont le chemin est indiqué dans la dernière colonne.

La troisième tâche, `Cleanup DB`, doit être exécutée tous les dimanches à minuit. C'est spécifié par les entrées `0` et `0` dans les colonnes des minutes et des heures, et `0` dans la colonne du jour de la semaine. La tâche est exécutée par le script `clean_database.sh`, dont le chemin est indiqué dans la dernière colonne.

La quatrième tâche, `Backups`, doit être exécutée tous les dimanches à minuit. C'est indiqué par les entrées `0` et `0` dans les colonnes des minutes et des heures, et `7` dans la colonne du jour de la semaine. La tâche est exécutée par le script `backup.sh`, dont le chemin est indiqué dans la dernière colonne.

Il est également possible de recevoir des notifications lorsqu'une tâche s'exécute avec succès ou échoue. De plus, on peut créer des logs pour surveiller l'exécution des tâches.

## Systemd vs. Cron

Systemd et Cron sont tous deux des outils utilisables sur les systèmes Linux pour planifier et automatiser des processus. La différence clé entre ces deux outils réside dans leur mode de configuration. Avec Systemd, il faut créer un script de timer et de service qui indique au système d'exploitation quand exécuter les tâches. Avec Cron, en revanche, il faut créer un fichier `crontab` qui indique au démon cron quand exécuter les tâches.
