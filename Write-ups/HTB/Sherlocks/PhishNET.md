---
tags:
  - writeup/htb
  - ctf
  - phishing
  - email-analysis
  - ioc
  - incident-response
---

# PhishNET

## Contexte

Un email suspect a été reçu le 26 février 2025. L’objet affiché était :  
**“Urgent: Invoice Payment Required - Overdue Notice”**.

L’attaquant tente de faire croire à une facture impayée en incitant l’utilisateur à cliquer sur un lien ou à ouvrir une pièce jointe ZIP contenant un exécutable déguisé.

---

## Analyse des en-têtes

- **Expéditeur déclaré (From):** `finance@business-finance.com`
    
- **Reply-To:** `support@business-finance.com`
    
- **IP d’origine (X-Originating-IP):** `45.67.89.10`
    
- **Serveur relais:** `relay.business-finance.com`
    
- **Résultat SPF:** Pass
    
- **Résultat DKIM/DMARC:** Pass (falsification ou domaine compromis possible)
    

La chaîne Received contient des adresses IP issues des plages de documentation (198.51.100.* et 203.0.113.*), ce qui indique une falsification.

---

## Corps de l’email

- Ton alarmiste et insistant sur l’urgence du paiement.
    
- Montant indiqué : 4 750 USD.
    
- Lien frauduleux :


https://secure.business-finance.com/invoice/details/view/INV2025-0987/payment
- Nom de la société présentée : **Business Finance Ltd.**
    

---

## Pièce jointe

- **Nom de la pièce jointe ZIP :** `Invoice_2025_Payment.zip`
    
- **SHA-256 (extrait analysé) :**  
    `8379c41239e9af845b2ab6c27a7509ae8804d7d73e455c800a551b22ba25bb4a`
    
- **Contenu du ZIP :** `invoice_document.pdf.bat`  
    → un fichier batch Windows (.bat) masqué en faux PDF.
    
```bash ─tximista at zaworudo in ~/Téléchargements 25-09-12 - 23:41:30  
╰─○ echo "UEsDBBQAAAAIABh/WloXPY4qcxITALvMGQAYAAAAaW52b2ljZV9kb2N1bWVudC5wZGYuYmF0zL3ZzuzIsR18LQN+h62DPujWX0e7"| base64 -d  
P▒ZZ=�*s��▒invoice_document.pdf.bat̽���ȱ|-~���>��_G�%                                                                                                
╭─tximista at zaworudo in ~/Téléchargements 25-09-13 - 0:01:47  
╰─○ echo 'UEsDBBQAAAAIABh/WloXPY4qcxITALvMGQAYAAAAaW52b2ljZV9kb2N1bWVudC5wZGYuYmF0zL3ZzuzIsR18LQN+h62DPujWX0e7' | base64 -d > nvoice_2025_Payment  
.zip


```

---

## MITRE ATT&CK

- **T1566.001** : Phishing: Spearphishing Attachment
    
Technique du Mitre attack
[https://attack.mitre.org/techniques/T1566/001/] 

## Indicateurs de compromission (IOCs)

- Domaine : `business-finance.com`
    
- Domaine frauduleux : `secure.business-finance.com`
    
- IP d’origine : `45.67.89.10`
    
- SHA-256 de la pièce jointe : `8379c41239e9af845b2ab6c27a7509ae8804d7d73e455c800a551b22ba25bb4a`
    
- Nom du fichier malveillant : `invoice_document.pdf.bat`
    

---

## Recommandations

1. Bloquer les domaines et IP identifiés au niveau de la passerelle.
    
2. Mettre en quarantaine les emails contenant cette campagne.
    
3. Ajouter le hash SHA-256 aux bases IOC du SIEM/EDR.
    
4. Sensibiliser les utilisateurs : une facture ne devrait jamais être transmise sous la forme d’un fichier exécutable masqué.
    
5. En cas d’ouverture de la pièce jointe, isoler la machine, collecter les artefacts et lancer une réponse à incident.
