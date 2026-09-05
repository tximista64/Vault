---
tags:
  - active-directory
  - windows
  - ad-architecture
  - ldap
  - course/tcm-academy
---
# Logical AD components
AD DS SCHEMA

A kind of rule book

Define every class of objects that can be store in the directory

Enforces rules regarding object creation and configuration

|     |     |     |
| --- | --- | --- |
| Object Types | Function | Exemple |
| Class Object | What objects can be created in the directory | User, Computer |
| Attribute Object | Information than can be attached to an object | Display name |

Domain

Domains are used to group and manage objects in an organization

An administrative boundary for applying policies to group of objects

An replication boundary for replicating data between domain controllers

An authentication and authoriztion boundary that provides a way to limit the scope of access to ressources

Trees

A domain tree is a hierarchy of domains in AD DS

Share a contiguous namespace with the parent domain

Can have additional child domain

By default create a two-way transitive trust with other domains

Forest

Forest ia a collection of one or more domain trees

Share a common schema

Share a common configuration partition

Share a common global catalogue to enable searching

Enable trust between all domain in the forest

Share the entreprise admins and schema admins group

OU

OU organizational units are containers that can contain users, groups computers or others OUs

OUs are used to: 

1.  Represent your organization hierarchically and logically
2.  Manage a collection of objects in a consistant way
3.  Delegate permissionto administrer group of objects
4.  Apply policies

Trusts

Trust provide a mechanism for users to gain access to ressources in an another domain

|     |     |     |
| --- | --- | --- |
| Types of trust | Description | Diagram |
| Directional | The trust direction flows from trusting domain to the trusted domain | ![](Logical%20AD%20components%20Directio) |
| Transitive | The trust relationship is extended beyond a two domain trust to include other trusted domains | ![](Logical%20AD%20components%20trust-re) |

All domains in the forest trust  all the other domains in the forest

Trusts can extend outside the forest

Objects

![](Logical%20AD%20components%20image.pn)

