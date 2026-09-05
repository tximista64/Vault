---
tags:
  - linux
  - package-management
  - course/htb-academy
---
# Package Management

Que l'on travaille en tant qu'administrateur système, que l'on entretienne ses propres machines Linux à la maison, ou que l'on construise/mette à jour/maintienne notre distribution de pentest préférée, il est crucial d'avoir une solide compréhension des gestionnaires de paquets Linux disponibles et des différentes façons de les utiliser pour installer, mettre à jour ou supprimer des paquets. Les paquets (`packages`) sont des archives qui contiennent les binaires d'un logiciel, des fichiers de configuration, des informations sur les dépendances, et permettent de suivre les mises à jour (`updates`) et montées de version (`upgrades`). Les fonctionnalités que la plupart des systèmes de gestion de paquets fournissent sont :

- Le téléchargement des paquets (`package downloading`)
- La résolution des dépendances (`dependency resolution`)
- Un format binaire de paquet standardisé
- Des emplacements standards d'installation et de configuration
- Des fonctionnalités et configurations système additionnelles
- Le contrôle qualité

On peut utiliser de nombreux systèmes de gestion de paquets différents, couvrant différents types de fichiers comme les `.deb`, `.rpm`, et d'autres. La contrainte de la gestion de paquets est que le logiciel à installer doit être disponible sous forme de paquet correspondant. Typiquement, celui-ci est créé, proposé et maintenu de façon centralisée par les distributions Linux. Ainsi, le logiciel est intégré directement au système, et ses différents répertoires sont répartis à travers celui-ci. Le logiciel de gestion de paquets récupère depuis le paquet lui-même les changements nécessaires à l'installation, puis les applique pour installer le paquet avec succès. Si le gestionnaire de paquets détecte que des paquets supplémentaires, pas encore installés, sont nécessaires au bon fonctionnement du paquet, une dépendance est ajoutée : soit il avertit l'administrateur, soit il tente de télécharger le logiciel manquant depuis un dépôt (`repository`), par exemple, pour l'installer au préalable.

Si un logiciel installé a été supprimé, le système de gestion de paquets reprend alors les informations du paquet, les modifie selon sa configuration, et supprime les fichiers. Il existe différents programmes de gestion de paquets utilisables à cet effet. Voici une liste d'exemples de tels programmes :

| Commande | Description |
|---|---|
| `dpkg` | `dpkg` est un outil permettant d'installer, construire, supprimer et gérer les paquets Debian. Le frontend principal et le plus convivial pour `dpkg` est `aptitude`. |
| `apt` | `apt` fournit une interface en ligne de commande de haut niveau pour le système de gestion de paquets. |
| `aptitude` | `aptitude` est une alternative à `apt` et constitue également une interface de haut niveau pour le gestionnaire de paquets. |
| `snap` | Installe, configure, met à jour et supprime les paquets snap. Les snaps permettent la distribution sécurisée des dernières applications et utilitaires pour le cloud, les serveurs, les postes de travail et l'internet des objets. |
| `gem` | `gem` est le frontend de RubyGems, le gestionnaire de paquets standard pour Ruby. |
| `pip` | `pip` est un installateur de paquets Python recommandé pour installer des paquets Python non disponibles dans l'archive Debian. Il peut fonctionner avec des dépôts de contrôle de version (actuellement uniquement Git, Mercurial et Bazaar), journalise abondamment sa sortie, et empêche les installations partielles en téléchargeant tous les prérequis avant de démarrer l'installation. |
| `git` | `git` est un système de contrôle de versions distribué, rapide et évolutif, avec un ensemble de commandes inhabituellement riche fournissant à la fois des opérations de haut niveau et un accès complet aux mécanismes internes. |

Il est fortement recommandé de configurer sa propre machine virtuelle (VM) localement pour expérimenter. Expérimentons un peu sur notre VM locale et étendons-la avec quelques paquets supplémentaires. Commençons par installer `git` en utilisant `apt`.

## Advanced Package Manager (APT)

Les distributions Linux basées sur Debian utilisent le gestionnaire de paquets APT. Un paquet est un fichier archive contenant plusieurs fichiers `.deb`. L'utilitaire `dpkg` est utilisé pour installer des programmes à partir du fichier `.deb` associé. APT facilite la mise à jour et l'installation de programmes car beaucoup de programmes ont des dépendances. Lors de l'installation d'un programme à partir d'un fichier `.deb` autonome, on peut rencontrer des problèmes de dépendances et devoir télécharger et installer un ou plusieurs paquets supplémentaires. APT simplifie et rend plus efficace ce processus en regroupant toutes les dépendances nécessaires à l'installation d'un programme.

Chaque distribution Linux utilise des dépôts de logiciels (`software repositories`) mis à jour fréquemment. Lorsqu'on met à jour un programme ou qu'on en installe un nouveau, le système interroge ces dépôts pour trouver le paquet désiré. Les dépôts peuvent être étiquetés comme stables (`stable`), en test (`testing`) ou instables (`unstable`). La plupart des distributions Linux utilisent le dépôt le plus stable, ou "principal" (`main`). Cela peut être vérifié en consultant le contenu du fichier `/etc/apt/sources.list`. La liste des dépôts pour Parrot OS se trouve dans `/etc/apt/sources.list.d/parrot.list`.

```shellsession
Tximista64@htb[/htb]$ cat /etc/apt/sources.list.d/parrot.list

# parrot repository
# this file was automatically generated by parrot-mirror-selector
deb http://htb.deb.parrot.sh/parrot/ rolling main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ rolling main contrib non-free
deb http://htb.deb.parrot.sh/parrot/ rolling-security main contrib non-free
#deb-src https://deb.parrot.sh/parrot/ rolling-security main contrib non-free
```

APT utilise une base de données appelée le cache APT (`APT cache`). Celle-ci sert à fournir hors-ligne des informations sur les paquets installés sur le système. On peut fouiller le cache APT, par exemple, pour trouver tous les paquets liés à Impacket.

```shellsession
Tximista64@htb[/htb]$ apt-cache search impacket

impacket-scripts - Links to useful impacket scripts examples
polenum - Extracts the password policy from a Windows system
python-pcapy - Python interface to the libpcap packet capture library (Python 2)
python3-impacket - Python3 module to easily build and dissect network protocols
python3-pcapy - Python interface to the libpcap packet capture library (Python 3)
```

On peut ensuite afficher des informations supplémentaires sur un paquet.

```shellsession
Tximista64@htb[/htb]$ apt-cache show impacket-scripts

Package: impacket-scripts
Version: 1.4
Architecture: all
Maintainer: Kali Developers <devel@kali.org>
Installed-Size: 13
Depends: python3-impacket (>= 0.9.20), python3-ldap3 (>= 2.5.0), python3-ldapdomaindump
Breaks: python-impacket (<< 0.9.18)
Replaces: python-impacket (<< 0.9.18)
Priority: optional
Section: misc
Filename: pool/main/i/impacket-scripts/impacket-scripts_1.4_all.deb
Size: 2080
<SNIP>
```

On peut aussi lister tous les paquets installés.

```shellsession
Tximista64@htb[/htb]$ apt list --installed

Listing... Done
accountsservice/rolling,now 0.6.55-2 amd64 [installed,automatic]
adapta-gtk-theme/rolling,now 3.95.0.11-1 all [installed]
adduser/rolling,now 3.118 all [installed]
adwaita-icon-theme/rolling,now 3.36.1-2 all [installed,automatic]
aircrack-ng/rolling,now 1:1.6-4 amd64 [installed,automatic]
<SNIP>
```

S'il manque certains paquets, on peut les rechercher et les installer avec la commande suivante.

```shellsession
Tximista64@htb[/htb]$ sudo apt install impacket-scripts -y

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following NEW packages will be installed:
  impacket-scripts
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 2,080 B of archives.
After this operation, 13.3 kB of additional disk space will be used.
Get:1 https://euro2-emea-mirror.parrot.sh/mirrors/parrot rolling/main amd64 impacket-scripts all 1.4 [2,080 B]
Fetched 2,080 B in 0s (15.2 kB/s)
Selecting previously unselected package impacket-scripts.
(Reading database ... 378459 files and directories currently installed.)
Preparing to unpack .../impacket-scripts_1.4_all.deb ...
Unpacking impacket-scripts (1.4) ...
Setting up impacket-scripts (1.4) ...
Scanning application launchers
Removing duplicate launchers from Debian
Launchers are updated
```

### Git

Maintenant que `git` est installé, on peut l'utiliser pour télécharger des outils utiles depuis Github. L'un de ces projets s'appelle 'Nishang'. On travaillera avec ce projet plus tard. Pour l'instant, il faut se rendre sur le dépôt du projet et copier le lien Github avant d'utiliser `git` pour le télécharger.

Page GitHub pour 'samratashok/nishang' avec l'URL surlignée, le bouton 'Clone or download', et l'URL de clonage `https://github.com/samratashok/nishangl` affichée.

Néanmoins, avant de télécharger le projet, ses scripts et listes, il convient de créer un dossier dédié.

```shellsession
Tximista64@htb[/htb]$ mkdir ~/nishang/ && git clone https://github.com/samratashok/nishang.git ~/nishang

Cloning into '/opt/nishang/'...
remote: Enumerating objects: 15, done.
remote: Counting objects: 100% (15/15), done.
remote: Compressing objects: 100% (13/13), done.
remote: Total 1691 (delta 4), reused 6 (delta 2), pack-reused 1676
Receiving objects: 100% (1691/1691), 7.84 MiB | 4.86 MiB/s, done.
Resolving deltas: 100% (1055/1055), done.
```

### DPKG

On peut aussi télécharger les programmes et outils depuis les dépôts séparément. Dans cet exemple, on télécharge `strace` pour Ubuntu 18.04 LTS.

```shellsession
Tximista64@htb[/htb]$ wget http://archive.ubuntu.com/ubuntu/pool/main/s/strace/strace_4.21-1ubuntu1_amd64.deb

--2020-05-15 03:27:17--  http://archive.ubuntu.com/ubuntu/pool/main/s/strace/strace_4.21-1ubuntu1_amd64.deb
Resolving archive.ubuntu.com (archive.ubuntu.com)... 91.189.88.142, 91.189.88.152, 2001:67c:1562::18, ...
Connecting to archive.ubuntu.com (archive.ubuntu.com)|91.189.88.142|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 333388 (326K) [application/x-debian-package]
Saving to: 'strace_4.21-1ubuntu1_amd64.deb'

strace_4.21-1ubuntu1_amd64.deb       100%[===================================================================>] 325,57K  --.-KB/s    in 0,1s    

2020-05-15 03:27:18 (2,69 MB/s) - 'strace_4.21-1ubuntu1_amd64.deb' saved [333388/333388]
```

De plus, on peut désormais utiliser `apt` comme `dpkg` pour installer le paquet. Puisqu'on a déjà travaillé avec `apt`, on va se tourner vers `dpkg` dans l'exemple suivant.

```shellsession
Tximista64@htb[/htb]$ sudo dpkg -i strace_4.21-1ubuntu1_amd64.deb 

(Reading database ... 154680 files and directories currently installed.)
Preparing to unpack strace_4.21-1ubuntu1_amd64.deb ...
Unpacking strace (4.21-1ubuntu1) over (4.21-1ubuntu1) ...
Setting up strace (4.21-1ubuntu1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
```

Avec cela, on a déjà installé l'outil et on peut vérifier son bon fonctionnement.

```shellsession
Tximista64@htb[/htb]$ strace -h

usage: strace [-CdffhiqrtttTvVwxxy] [-I n] [-e expr]...
              [-a column] [-o file] [-s strsize] [-P path]...
              -p pid... / [-D] [-E var=val]... [-u username] PROG [ARGS]
   or: strace -c[dfw] [-I n] [-e expr]... [-O overhead] [-S sortby]
              -p pid... / [-D] [-E var=val]... [-u username] PROG [ARGS]

Output format:
  -a column      alignment COLUMN for printing syscall results (default 40)
  -i             print instruction pointer at time of syscall
```
