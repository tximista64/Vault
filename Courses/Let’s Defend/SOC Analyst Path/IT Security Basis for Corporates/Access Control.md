---
tags:
  - access-control
  - mfa
  - zero-trust
  - soc
  - course/lets-defend
---

# Access Control


Implement policies, processes and technologies that ensure that only authorized 
users are granted the least privileges necessary. There is no magic 
bullet here that works for everyone, you need to adapt, take it step by 
step.

### **Password & MFA**

The lowest level of protection is the implementation of a password 
policy within your environment. In the case of a Windows environment, 
this policy should be set in the "Default Domain Policy" to ensure that 
it applies to all computers.

Whenever possible, use stronger mechanisms than password 
authentication, such as biometrics, one-time passwords and application 
tokens. Multi-factor authentication (MFA), via SMS or application 
authenticator, is highly recommended, starting with privileged users and
 extending to all users.

### **Zero Trust**

Identify and disable unused accounts, eliminate shared accounts, 
remove unnecessary privileges and enforce strong password policies.

### **Audit of Account Usage**

Monitor and analyze user activity for anomalous behavior such as 
access attempts outside of normal business hours or from unusual 
locations. Your fleet should not contain more than 15% of accounts with 
the "domain administrator" privilege.

