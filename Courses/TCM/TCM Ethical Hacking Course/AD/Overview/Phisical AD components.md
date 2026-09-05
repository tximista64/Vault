---
tags:
  - active-directory
  - windows
  - domain-controller
  - ntds
  - course/tcm-academy
---
# Phisical AD components
Domain controller

It hosts the phone book

Host a copy of AD DS (Active Directory Domain Service) directory store

Provide authentication and authorization services

Replicate updates to other DC in the domain and forest

Allow administrative access to manage user accounts and network ressources

AD DS Data store

Consists of the Ntds.dit files ==> stores password hashes

Is stored by default in the %SystemRoot%\\NTDS folder on all domain controllers

Is accesssible only through the domain controller processes and protocoles

