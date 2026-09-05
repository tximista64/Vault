---
tags:
  - networking
  - vlan
  - cisco
  - course/htb-academy
---

# Vendor Specific Information — Cisco IOS & VLANs

## Cisco IOS

OS des équipements réseau Cisco (routeurs, switches). Géré via **CLI** ou **GUI**.

**Protocoles supportés :** OSPF, BGP, VTP, STP, DHCP, ACLs…

**Types de mots de passe Cisco :**

| Type | Rôle |
|---|---|
| **User** | Accès à l'équipement |
| **Enable Password** | Accès au mode enable (fonctions avancées) |
| **Secret** | Sécurisation de services/outils distants |
| **Enable Secret** | Accès enable — stocké chiffré |

Identification d'un équipement Cisco via Telnet/SSH → message `User Access Verification`.

---

## VLANs

Segmentation logique d'un switch en **broadcast domains** isolés — sans router.

**Avantages :** organisation, sécurité, administration simplifiée, meilleures performances.

### Plages VLAN (Cisco)

| Plage | Usage |
|---|---|
| VLAN 1 | Default VLAN — ne pas modifier |
| 2–1001 | Normal-range — sauvegardés dans `vlan.dat` |
| 1002–1005 | Réservés Token Ring / FDDI |
| 1006–4094 | Extended-range — non sauvegardés |

### Access vs Trunk ports

- **Access port** : appartient à un seul VLAN.
- **Trunk port** : transporte plusieurs VLANs simultanément — relie switches entre eux.

### VLAN Tagging — IEEE 802.1Q

Standard interopérable (vs ISL, propriétaire Cisco, obsolète). Ajoute un header 4 octets dans la trame Ethernet :

| Champ | Taille | Rôle |
|---|---|---|
| **TPID** | 16 bits (0x8100) | Identifie la trame comme 802.1Q |
| **PCP** | 3 bits | Priorité |
| **DEI** | 1 bit | Éligibilité au drop |
| **VID** | 12 bits | VLAN ID (0–4094) |

**Double Tagging (802.1ad)** : plusieurs tags 802.1Q imbriqués.

### Membership statique vs dynamique

- **Statique** : port assigné manuellement à un VLAN — plus sécurisé.
- **Dynamique** (VMPS) : basé sur l'adresse MAC — risque de spoofing MAC (`macchanger`).

---

## VLAN Attacks

### VLAN Hopping
Exploit du **DTP** (Dynamic Trunking Protocol) de Cisco — l'attaquant simule un switch pour établir un trunk link et accéder à tous les VLANs.
- Outil : **Yersinia**

### Double-Tagging VLAN Hopping
Double tag 802.1Q : le switch strip le premier tag (native VLAN) et relaie le second vers un VLAN cible.
- Condition : l'attaquant doit être sur le même VLAN que le native VLAN du trunk port.
- Outils : **Yersinia**, **Scapy**

---

## VXLAN

Extension de VLAN pour data centers — **Layer 2 overlay sur Layer 3**.
- **VNI (VXLAN Network Identifier)** : 24 bits → **16 millions** de segments possibles (vs 4094 pour 802.1Q).
- Résout les limitations de STP et le manque de scalabilité des VLANs classiques.

---

## CDP (Cisco Discovery Protocol)

Protocole Layer 2 propriétaire Cisco — découverte automatique des équipements Cisco voisins.

Informations exposées : nom de l'équipement, IP, port, version IOS, modèle hardware.

> ⚠️ À désactiver si non nécessaire — expose des informations sensibles sur la topologie réseau.

---

## STP (Spanning Tree Protocol)

Évite les boucles réseau sur les switches interconnectés. Version moderne : **Rapid STP (802.1w)**.

## Analyse VLAN avec Wireshark / tshark

```bash
# Filtrer le trafic 802.1Q
# Wireshark : vlan
# Wireshark : vlan.id == 10

# Énumérer les VLAN IDs depuis un pcap
tshark -r capture.pcapng -T fields -e vlan.id | sort -n -u
```

## Configuration VLAN sous Linux

```bash
# Charger le module 802.1Q
sudo modprobe 8021q

# Créer une interface VLAN
sudo ip link add link eth0 name eth0.20 type vlan id 20
sudo ip addr add 192.168.1.1/24 dev eth0.20
sudo ip link set up eth0.20
```

## Configuration VLAN sous Windows (PowerShell)

```powershell
# Lister les interfaces
Get-NetAdapter | Format-Table -AutoSize

# Vérifier le VLAN ID
Get-NetAdapterAdvancedProperty -DisplayName "vlan id"

# Assigner un VLAN ID
Set-NetAdapter -Name "Ethernet 2" -VlanID 10
```
