---
title: "Variables d'environnement Linux"
tags:
  - linux
  - administration-systeme
  - cli
  - bash
  - shell
  - variables
  - environnement
  - path
  - export
  - sysadmin
aliases:
  - "Variables d'environnement"
  - "PATH et export sous Bash"
---

# Variables d'environnement Linux

> [!summary]
> Une variable d’environnement est un couple `NOM=valeur` conservé par le shell et transmis aux programmes enfants lorsqu’elle est exportée.
>
> Les commandes essentielles :
> - `echo "$NOM"` → lire ;
> - `env` → lister les variables exportées ;
> - `export NOM=valeur` → exporter ;
> - `unset NOM` → supprimer ;
> - `PATH` → indiquer où chercher les commandes.

## 1. Qu’est-ce qu’une variable d’environnement ?

Une variable est une paire :

```text
NOM=valeur
```

Exemple :

```bash
LANG=fr_FR.UTF-8
```

Elle permet de configurer le comportement du shell et des programmes lancés depuis celui-ci.

## 2. Afficher une variable

```bash
echo "$HOME"
```

Sans `$` :

```bash
echo HOME
```

affiche simplement le texte `HOME`.

> [!tip]
> En pratique, préférer les guillemets :
>
> ```bash
> echo "$HOME"
> ```

## 3. Variables essentielles

| Variable | Rôle |
|---|---|
| `HOME` | répertoire personnel |
| `USER` | utilisateur courant |
| `SHELL` | shell de login configuré |
| `PATH` | chemins de recherche des commandes |
| `PWD` | répertoire courant |
| `LANG` | langue / encodage |
| `HOSTNAME` | nom de machine |

Exemples :

```bash
echo "$USER"
echo "$SHELL"
echo "$LANG"
echo "$PWD"
```

## 4. Lister les variables exportées

```bash
env
```

Filtrer :

```bash
env | grep '^PATH='
```

## 5. Créer une variable locale

```bash
PRENOM="Alice"
```

Puis :

```bash
echo "$PRENOM"
```

## 6. Pas d’espace autour de `=`

Correct :

```bash
PRENOM="Alice"
```

Incorrect :

```bash
PRENOM = "Alice"
```

Le shell interprète alors `PRENOM` comme une commande.

> [!important]
> Toujours écrire :
>
> ```text
> NOM=valeur
> ```

## 7. Variable locale vs exportée

Une variable créée ainsi :

```bash
PRENOM="Alice"
```

reste dans le shell courant.

Un programme enfant ne la voit pas forcément.

Exemple :

```bash
bash -c 'echo "$PRENOM"'
```

peut ne rien afficher.

## 8. Exporter une variable

```bash
export PRENOM="Alice"
```

Puis :

```bash
bash -c 'echo "$PRENOM"'
```

affiche la valeur.

## 9. Créer et exporter en une ligne

```bash
export PROJET="mon-site"
```

## 10. Héritage des variables

Les sous-processus héritent des variables **exportées**.

```text
shell parent
   ↓ export
programme enfant
```

L’inverse ne fonctionne pas : un enfant ne peut pas modifier directement l’environnement de son parent.

## 11. Comprendre `PATH`

`PATH` contient une liste de répertoires séparés par `:`.

```bash
echo "$PATH"
```

Exemple :

```text
/usr/local/bin:/usr/bin:/bin
```

## 12. Recherche des commandes

Quand on tape :

```bash
ls
```

le shell cherche dans les répertoires de `PATH`, dans l’ordre.

## 13. Voir où se trouve une commande

Le cours utilise :

```bash
which ls
```

Pour Bash, `type` est souvent plus informatif :

```bash
type ls
type -a ls
```

car il distingue aussi alias, fonctions et builtins.

## 14. Ajouter un dossier à `PATH`

```bash
export PATH="$HOME/scripts:$PATH"
```

> [!warning]
> Ne pas remplacer accidentellement tout le `PATH`.

Mauvais :

```bash
export PATH="$HOME/scripts"
```

Tu perds alors les chemins précédents dans le shell courant.

## 15. Préfixer ou suffixer `PATH`

Priorité à tes scripts :

```bash
export PATH="$HOME/scripts:$PATH"
```

Priorité aux commandes système :

```bash
export PATH="$PATH:$HOME/scripts"
```

L’ordre a une importance réelle.

## 16. Changement temporaire

Une commande comme :

```bash
export PATH="$HOME/scripts:$PATH"
```

ne dure que pour la session courante.

## 17. Rendre une variable persistante

Ajouter dans :

```text
~/.bashrc
```

Exemple :

```bash
export PROJET="mon-site"
export PATH="$HOME/scripts:$PATH"
```

Puis recharger :

```bash
source ~/.bashrc
```

ou :

```bash
. ~/.bashrc
```

## 18. Supprimer une variable

```bash
unset TEST
```

## 19. Diagnostiquer `command not found`

Premier réflexe :

```bash
echo "$PATH"
```

Puis :

```bash
type commande
```

ou :

```bash
command -v commande
```

## 20. Vérifier si une variable existe

Variable exportée :

```bash
env | grep '^MA_VAR='
```

Variable shell :

```bash
declare -p MA_VAR
```

si Bash la connaît.

## 21. `.bashrc` et fichiers de login

En login shell, Bash cherche notamment :

```text
~/.bash_profile
~/.bash_login
~/.profile
```

et s’arrête au **premier trouvé**.

## 22. Piège : fichiers de login qui se masquent

Si :

```text
~/.bash_profile
```

existe, Bash ne continue pas automatiquement vers :

```text
~/.profile
```

Un réglage placé uniquement dans `.profile` peut donc ne jamais être chargé.

## 23. Shell interactif vs login

Deux notions distinctes :

```text
interactive
login
```

Un shell peut être :

- interactif login ;
- interactif non-login ;
- non interactif ;
- non interactif et non-login.

## 24. Commande SSH distante

Exemple :

```bash
ssh serveur 'echo "$PATH"'
```

Ce shell distant n’est généralement ni interactif ni login.

Le support souligne qu’avec Bash lancé via SSH distant, `.bashrc` peut néanmoins être lu dans ce cas spécifique.

Conséquence : une variable présente en session interactive peut disparaître en automatisation si elle n’est pas définie dans le bon fichier.

## 25. Mauvais fichier de configuration

Cas typiques :

```text
variable dans .bash_profile uniquement
commande distante non-login
```

ou :

```text
variable dans .profile
mais .bash_profile existe déjà
```

## 26. Recharger un fichier

```bash
source fichier
```

ou :

```bash
. fichier
```

Cela exécute le fichier **dans le shell courant**.

Différence avec :

```bash
bash fichier
```

qui lance un sous-shell séparé.

## 27. `source` et variables

Si `env.sh` contient :

```bash
export PROJET="demo"
```

alors :

```bash
source env.sh
```

rend `PROJET` disponible dans le shell courant.

Avec :

```bash
bash env.sh
```

la variable disparaît quand le sous-shell se ferme.

## 28. Dépannage rapide

| Symptôme | Cause probable | Solution |
|---|---|---|
| `command not found` | répertoire absent de `PATH` | `echo "$PATH"` puis corriger |
| variable vide | non définie | `declare -p NOM` |
| enfant ne voit pas variable | `export` oublié | `export NOM=valeur` |
| variable perdue après fermeture | non persistante | ajouter dans `.bashrc` |
| SSH distant ne voit pas variable | mauvais fichier de démarrage | vérifier `.bashrc` / login files |
| `.profile` ignoré | `.bash_profile` présent | vérifier ordre de lecture |
| `NOM = valeur` échoue | espaces autour de `=` | `NOM=valeur` |
| commandes disparaissent | `PATH` écrasé | restaurer `:$PATH` |
| `source` fonctionne mais `bash fichier` non | sous-shell | utiliser `source` |

## 29. Commandes à retenir

```bash
# Lire
echo "$HOME"
echo "$PATH"

# Lister
env

# Créer
VAR="valeur"

# Exporter
export VAR="valeur"

# Supprimer
unset VAR

# PATH
export PATH="$HOME/scripts:$PATH"

# Résolution commande
which ls
type ls
type -a ls
command -v ls

# Recharger config
source ~/.bashrc
. ~/.bashrc

# Vérifier une variable shell
declare -p VAR
```

## 30. Réflexes sysadmin

1. Toujours écrire `NOM=valeur` sans espaces.
2. Utiliser `export` si un processus enfant doit voir la variable.
3. Ne jamais écraser `PATH` sans conserver l’existant.
4. Se rappeler que l’ordre de `PATH` détermine la priorité.
5. Vérifier `PATH` lors d’un `command not found`.
6. Utiliser `type` ou `command -v` pour comprendre ce qui sera exécuté.
7. Utiliser `source` pour modifier l’environnement du shell courant.
8. Distinguer shell interactif, login et non interactif.
9. Vérifier `.bash_profile`, `.bash_login`, `.profile` et `.bashrc` selon le contexte.
10. Tester les variables dans le contexte réel d’automatisation, pas seulement dans un SSH interactif.



# 32. Guillemets doubles vs simples

Une variable peut servir à construire une autre variable.

Avec des guillemets doubles :

```bash
export APPLI="facturation"
export BANNIERE="Session $APPLI ouverte"
```

Résultat :

```text
Session facturation ouverte
```

Avec des guillemets simples :

```bash
export BANNIERE='Session $APPLI ouverte'
```

Résultat littéral :

```text
Session $APPLI ouverte
```

> [!important]
> Les guillemets doubles permettent l’expansion des variables ; les guillemets simples la bloquent.

L’expansion a lieu au moment de l’affectation :

```bash
APPLI="facturation"
BANNIERE="Session $APPLI"
APPLI="inventaire"
```

`BANNIERE` reste :

```text
Session facturation
```

---

# 33. Héritage sur plusieurs générations

Une variable exportée est héritée par les enfants, puis par leurs propres enfants.

```bash
export APPLI="facturation"

bash -c 'bash -c '\''echo "$APPLI"'\'''
```

Le petit-fils voit encore :

```text
facturation
```

L’environnement se propage donc **vers le bas de l’arbre des processus**.

---

# 34. `env` ne montre que les variables exportées

Exemple :

```bash
LOCALE_SEULE="valeur"
export APPLI="facturation"

env | grep -E '^(APPLI|LOCALE_SEULE)='
```

Seule `APPLI` apparaît.

Pour vérifier une variable locale au shell :

```bash
echo "$LOCALE_SEULE"
```

ou :

```bash
declare -p LOCALE_SEULE
```

---

# 35. `PATH` : l’ordre décide réellement

Le shell prend la **première commande trouvée**.

Avec :

```bash
PATH="$PATH:$HOME/outils"
```

les commandes système restent prioritaires.

Avec :

```bash
PATH="$HOME/outils:$PATH"
```

les commandes locales passent avant.

Exemple de diagnostic :

```bash
which sort
type -a sort
```

> [!warning]
> Préfixer un répertoire non maîtrisé devant `/usr/bin` peut conduire à exécuter un binaire local à la place d’un outil système.

---

# 36. Codes `126` et `127`

Deux codes utiles pour diagnostiquer une commande :

```text
126 → commande trouvée, mais non exécutable
127 → commande introuvable
```

Exemple `126` :

```bash
./script.sh
```

avec fichier non exécutable.

Exemple `127` :

```bash
commande-inexistante
```

> [!tip]
> `127` oriente vers `PATH` / nom de commande.
>
> `126` oriente vers permissions, format ou possibilité d’exécution.

---

# 37. Sourcer ne nécessite pas `chmod +x`

Un fichier destiné uniquement à être chargé avec :

```bash
source parametres.sh
```

n’a pas besoin d’être exécutable.

Un simple :

```bash
chmod 0644 parametres.sh
```

suffit tant qu’il reste lisible.

Pour l’exécuter directement :

```bash
./parametres.sh
```

il faut en revanche le bit `x`.

---

# 38. `source` vs exécution : comprendre avec le PID

Exécuté :

```bash
./script.sh
```

le script tourne dans un nouveau processus.

Sourcé :

```bash
source script.sh
```

il tourne dans le shell courant.

On peut observer cela avec :

```bash
echo "$$"
```

Le PID reste identique avec `source`.

> [!important]
> C’est la raison pour laquelle un `export` effectué dans un fichier sourcé reste disponible dans le shell courant.

---

# 39. Déterminer le type de shell

Deux questions indépendantes :

```text
le shell est-il interactif ?
le shell est-il un login shell ?
```

Tester l’interactivité :

```bash
echo "$-"
```

Si la valeur contient :

```text
i
```

le shell est interactif.

Tester le login shell :

```bash
shopt -q login_shell && echo login || echo non-login
```

---

# 40. Quelques contextes Bash typiques

| Situation | Interactif | Login |
|---|---:|---:|
| session SSH avec terminal | oui | généralement oui |
| `ssh hôte 'commande'` | non | non |
| `bash -lc 'commande'` | non | oui |
| `bash -c 'commande'` | non | non |
| `bash -ic 'commande'` | oui | non |

> [!important]
> Ne jamais déduire le fichier de configuration lu uniquement à partir de « SSH » ou « terminal » : vérifier le type réel du shell.

---

# 41. `~/.bashrc` en commande SSH distante

Cas particulièrement important pour l’automatisation :

```bash
ssh serveur 'commande'
```

Ce shell est non interactif et non-login, mais Bash peut lire `~/.bashrc` dans ce contexte SSH particulier.

Conséquence pratique :

```text
export dans ~/.bashrc
```

peut être visible à la fois :

- en session interactive ;
- dans certaines commandes SSH distantes.

Alors qu’un export placé uniquement dans :

```text
~/.bash_profile
```

peut être invisible à :

```bash
ssh serveur 'commande'
```

---

# 42. Pourquoi `.bashrc` est lu pendant un login

Sur beaucoup de distributions, un shell de login ne lit pas directement `~/.bashrc`.

C’est souvent :

```text
~/.bash_profile
```

qui le source explicitement :

```bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

Si ce bloc disparaît, le login shell peut ne plus charger `~/.bashrc`.

---

# 43. Ordre des fichiers de login

Pour un login shell, Bash cherche :

```text
~/.bash_profile
~/.bash_login
~/.profile
```

et s’arrête au **premier fichier existant**.

Donc :

```text
~/.bash_profile existe
```

implique généralement que :

```text
~/.bash_login
~/.profile
```

ne seront pas lus.

Vérifier ce qui existe :

```bash
ls -la ~/.bash_profile ~/.bash_login ~/.profile
```

---

# 44. `/etc/profile` et `/etc/profile.d/`

Les shells de login peuvent charger :

```text
/etc/profile
/etc/profile.d/*.sh
```

Le détail dépend de la distribution et des fichiers système présents.

> [!warning]
> Un `echo` n’est pas toujours un bon test pour savoir si un script de profil est exécuté : certaines configurations redirigent sa sortie en session non interactive.

Pour tester proprement, préférer une variable témoin :

```bash
TRACE_PROFILED=1
```

puis vérifier :

```bash
echo "$TRACE_PROFILED"
```

---

# 45. Ne jamais produire de sortie parasite dans `.bashrc`

Un simple :

```bash
echo "Bienvenue"
```

dans `~/.bashrc` peut casser des usages non interactifs.

Cela peut perturber :

```text
scp
sftp
rsync via ssh
outils d’automatisation
```

Symptôme possible :

```text
Received message too long
```

> [!danger]
> Un fichier de profil doit rester silencieux dans les contextes non interactifs sauf besoin parfaitement maîtrisé.

---

# 46. Ne jamais mettre `exit` au mauvais endroit

Un :

```bash
exit
```

placé dans `~/.bashrc` ou un fichier de profil peut empêcher l’exécution des commandes distantes.

Exemple :

```bash
ssh serveur 'uptime'
```

peut se connecter puis ne rien exécuter.

Le pire : le code retour peut sembler normal selon le contexte.

---

# 47. Sécuriser les modifications de `.bashrc`

Avant modification :

```bash
cp -a ~/.bashrc ~/.bashrc.bak
```

Vérifier uniquement la syntaxe :

```bash
bash -n ~/.bashrc
```

Tester dans un sous-shell :

```bash
bash -l
```

Si le résultat est mauvais :

```bash
exit
```

puis restaurer :

```bash
cp -a ~/.bashrc.bak ~/.bashrc
```

> [!danger]
> Ne jamais fermer la dernière session SSH fonctionnelle avant d’avoir vérifié qu’une nouvelle connexion fonctionne.

---

# 48. Tester avec un `HOME` jetable

Pour expérimenter sans toucher aux vrais fichiers :

```bash
mkdir -p /tmp/bacasable
HOME=/tmp/bacasable bash -lc true
```

On peut y créer :

```text
.bash_profile
.bash_login
.profile
.bashrc
```

et observer lesquels sont lus.

Très pratique pour comprendre les règles Bash sans casser son environnement.

---

# 49. Dépannage avancé

| Symptôme | Cause probable | Réflexe |
|---|---|---|
| commande retourne `127` | commande introuvable | `type`, `command -v`, `PATH` |
| commande retourne `126` | non exécutable | permissions / shebang |
| enfant ne voit pas variable | variable non exportée | `export` |
| variable disparaît après script | script exécuté | `source` |
| variable marche en SSH interactif mais pas distant | mauvais fichier de profil | vérifier `.bashrc` |
| `.profile` ne change rien | `.bash_profile` existe | ordre de lecture |
| mauvais binaire exécuté | priorité `PATH` | `type -a` |
| toutes les commandes externes disparaissent | `PATH` écrasé | restaurer `$PATH` |
| SSH se connecte mais commande absente | `exit` dans profil | inspecter fichiers Bash |
| `scp` / `sftp` casse | sortie parasite de profil | supprimer `echo` |
| profil modifié récemment | syntaxe cassée | `bash -n ~/.bashrc` |

---

# 50. Réflexes supplémentaires

1. Utiliser les guillemets doubles si une variable doit être développée.
2. Utiliser les guillemets simples pour conserver du texte littéral.
3. Connaître la différence `126` / `127`.
4. Savoir que `source` n’exige pas le bit exécutable.
5. Utiliser `echo "$-"` et `shopt -q login_shell` pour diagnostiquer un shell.
6. Ne pas mettre de sortie décorative dans `.bashrc`.
7. Ne jamais mettre `exit` dans un fichier de profil sans raison très précise.
8. Tester un `.bashrc` avec `bash -n` avant de fermer sa session.
9. Garder une connexion SSH saine pendant toute modification des profils.
10. Expérimenter avec un `HOME` temporaire quand on veut comprendre l’ordre de lecture.


## À retenir en une phrase

> **Une variable locale vit dans le shell courant, `export` la transmet aux enfants, et `PATH` contrôle où Bash cherche les commandes.**
