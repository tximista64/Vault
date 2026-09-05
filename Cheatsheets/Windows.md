# Windows Fundamentals - Cheat Sheet

**tags**: #cheatsheet #windows #powershell #sysadmin #fundamentaux

---

## Accès à distance

| Command                                                             | Description                          |
|----------------------------------------------------------------------|--------------------------------------|
| `xfreerdp /v:<IP> /u:htb-student /p:<password>`                    | Connexion RDP au système distant     |

---

## PowerShell - Commandes de base

| Command                                                         | Description                                 |
|------------------------------------------------------------------|---------------------------------------------|
| `Get-WmiObject -Class win32_OperatingSystem`                   | Infos sur l'OS via WMI                      |
| `Get-Service`                                                  | Voir les services en cours                  |
| `help <commande>`                                              | Aide sur une commande                       |
| `get-alias`                                                    | Lister les alias PowerShell                 |
| `New-Alias -Name "Show-Files" Get-ChildItem`                   | Créer un alias PowerShell                   |
| `Get-Module | select Name,ExportedCommands | fl`            | Afficher les modules et commandes exportées |
| `Get-ExecutionPolicy -List`                                    | Voir la stratégie d’exécution               |
| `Set-ExecutionPolicy Bypass -Scope Process`                    | Changer la stratégie pour la session        |
| `Invoke-WmiMethod`                                             | Appeler des méthodes WMI                    |

---

## Système et fichiers

| Command                                | Description                                     |
|----------------------------------------|-------------------------------------------------|
| `dir c:\ /a`                           | Lister tous les fichiers de C:\                 |
| `tree <répertoire>`                    | Affiche la structure du répertoire              |
| `tree c:\ /f | more`                   | Affiche toute l’arborescence page par page      |
| `icacls <répertoire>`                  | Affiche les permissions                         |
| `icacls c:\users /grant joe:f`         | Donne tous les droits à l'utilisateur `joe`     |
| `icacls c:\users /remove joe`          | Supprime les droits de l'utilisateur `joe`      |

---

## Registre et utilisateurs

| Command                        | Description                              |
|--------------------------------|------------------------------------------|
| `whoami /user`                | Affiche le SID de l'utilisateur courant  |
| `reg query <clé>`             | Interroge une clé du registre Windows    |

---

## Défense et sécurité

| Command                         | Description                                           |
|---------------------------------|-------------------------------------------------------|
| `Get-MpComputerStatus`          | Affiche l'état de Windows Defender                   |
| `sconfig`                       | Lance le menu de configuration de Windows Server Core |

---

## Outils classiques

| Command              | Description                                     |
|----------------------|-------------------------------------------------|
| `wmic os list brief` | Infos système avec `wmic`                      |

---

