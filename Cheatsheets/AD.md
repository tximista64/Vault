# Active Directory - Cheat Sheet

**tags**: #cheatsheet #windows #powershell #ad #sysadmin

---

## Connexions & Outils de base

| Command                                       | Description                                |
|-----------------------------------------------|--------------------------------------------|
| `xfreerdp /v:<IP> /u:<User> /p:<Password>`   | Connexion RDP à la cible                    |
| `ping <IP>`                                  | Vérification de connectivité réseau        |
| `Import-Module ActiveDirectory`              | Importer le module AD dans PowerShell      |

---

## Aide & Exploration

| Command                                    | Description                                       |
|--------------------------------------------|---------------------------------------------------|
| `Get-Module`                              | Liste les modules PowerShell chargés             |
| `Get-Command -Module ActiveDirectory`     | Liste des commandes du module AD                 |
| `Get-Help <cmd-let>`                      | Affiche l’aide d’une commande PowerShell         |

---

## Utilisateurs AD

| Command                                                                                  | Description                                  |
|-------------------------------------------------------------------------------------------|----------------------------------------------|
| `New-ADUser -Name "First Last" -Accountpassword (Read-Host -AsSecureString "Password") -Enabled $true -OtherAttributes @{'title'="Analyst";'mail'="f.last@domain.com"}` | Créer un nouvel utilisateur avec attributs |
| `Remove-ADUser -Identity <name>`                                                         | Supprimer un utilisateur                     |
| `Unlock-ADAccount -Identity <name>`                                                      | Déverrouiller un compte                      |
| `Set-ADAccountPassword -Identity <name> -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "NewPassword" -Force)` | Réinitialiser un mot de passe               |
| `Set-ADUser -Identity <user> -ChangePasswordAtLogon $true`                               | Forcer changement de mot de passe à la connexion suivante |

---

## Groupes AD

| Command                                                                                                               | Description                                |
|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| `New-ADOrganizationalUnit -Name "name" -Path "OU=folder,DC=domain,DC=local"`                                         | Créer une nouvelle unité d'organisation    |
| `New-ADGroup -Name "name" -SamAccountName analysts -GroupCategory Security -GroupScope Global -DisplayName "..." -Path "CN=Users,DC=domain,DC=local" -Description "..."` | Créer un groupe de sécurité avec attributs |
| `Add-ADGroupMember -Identity 'group' -Members 'user1,user2'`                                                         | Ajouter des utilisateurs à un groupe       |

---

## GPO (Group Policy Objects)

| Command                                                                                                                | Description                                  |
|-------------------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| `Copy-GPO -SourceName "GPO à copier" -TargetName "NouveauNom"`                                                        | Dupliquer une GPO                            |
| `New-GPLink -Name "NomGPO" -Target "OU=...DC=domain,DC=local" -LinkEnabled Yes`                                       | Lier une GPO à une OU (activation comprise)  |
| `Set-GPLink -Name "NomGPO" -Target "OU=...DC=domain,DC=local" -LinkEnabled Yes`                                       | Relier une GPO existante à une OU cible      |

---

## Ordinateurs AD

| Command                                                                                                               | Description                                |
|------------------------------------------------------------------------------------------------------------------------|--------------------------------------------|
| `Add-Computer -DomainName 'DOMAINE.LOCAL' -Credential 'DOMAINE\Utilisateur' -Restart`                                 | Joindre un ordinateur au domaine           |
| `Add-Computer -ComputerName 'Nom' -LocalCredential '.\localuser' -DomainName 'DOMAINE.LOCAL' -Credential 'DOMAINE\admin' -Restart` | Joindre un PC distant au domaine         |
| `Get-ADComputer -Identity "Nom" -Properties * \| Select CN,CanonicalName,IPv4Address`                                | Afficher les propriétés d’un ordinateur    |

---

## Références

- [Microsoft AD Overview](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/get-started/virtual-dc/active-directory-domain-services-overview)

