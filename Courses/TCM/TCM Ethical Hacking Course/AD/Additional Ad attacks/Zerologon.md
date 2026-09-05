---
tags:
  - zerologon
  - active-directory
  - windows
  - privilege-escalation
  - exploitation
  - course/tcm-academy
---
# Zerologon
![](Zerologon%20Screenshot%2020240119%20)

On teste si le Dc  est vulnérable

![](Screenshot_20240119_225422.png)

Ensuite on lance l'exploit 

![](Screenshot_20240121_214122.png)

un secret dump pour recup les hash avec le password blank crée par l'exploit

![](Screenshot_20240121_214257.png)

psexec pour le shell

