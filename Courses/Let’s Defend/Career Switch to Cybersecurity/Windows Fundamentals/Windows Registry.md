---
tags:
  - windows
  - windows-registry
  - course/lets-defend
---

# Windows Registry


**What is Windows Registry?**

Windows Registry is a hierarchical database that contains the operating 
system and system configurations related to the programs installed in 
the system. It keeps the information and settings of programs and 
hardware in this database. For example, when a program is installed on 
Windows, the program may choose to keep the expiry date of its license 
in the Windows Registry.

Windows Registry is an important component in Windows for attackers. The
 registry contains a lot of information about the Windows operating 
system. For example, information about programs that were installed on 
the system and uninstalled later may still remain in the registry. The 
information that the attackers want to obtain through the system is 
usually the information necessary for the continuation of the attack. 
For example, when the attackers seize the user accounts with limited 
privileges, they will probably keep hunting for those with higher 
privileges by collecting information about other users in the system.

The Registry contains important configurations and information about the
 system, as well as information about other programs installed on the 
system. Attackers may also want to add their own entries to the registry
 to be able to ensure persistence in the system. The SOC analyst should 
monitor suspicious changes to the registry to be able to detect any 
suspicious activities and behaviors of the attacker.

**Accessing the Registry**

A separate software should be used to access the registry files as they 
are not in a regular text-based format. "Registry Editor" that comes 
installed in Windows helps perform operations on the registry. For 
example, let's open the program called "Registry Editor":

As seen on the screenshot above, "Registry Editor" has a hierarchical 
navigation panel on the left. All entries in the registry are located 
under this structure.

**Registry Structure**

Windows registry entries are located at “%SystemRoot%\System32\Config”.

 
The registry contains two essential elements: “keys” and “values”. 
Registry keys are container objects similar to folders. Registry values 
​​are non-container objects similar to files. Keys may contain values 
​​and subkeys.

E.g. HKEY_LOCAL_MACHINE\Software\Microsoft\Windows refers to the subkey 
"Windows" of the subkey "Microsoft" of the subkey "Software" of the 
HKEY_LOCAL_MACHINE root key.

There are seven predefined root keys :

HKEY_LOCAL_MACHINE or HKLMHKEY_CURRENT_CONFIG or HKCCHKEY_CLASSES_ROOT or HKCRHKEY_CURRENT_USER or HKCUHKEY_USERS or HKUHKEY_PERFORMANCE_DATA (only in Windows NT, but invisible in the Windows Registry Editor)HKEY_DYN_DATA (only in Windows 9x, and visible in the Windows Registry Editor)

(Source: Wikipedia)

**HKEY_LOCAL_MACHINE or HKLM**
It is the section where computer-specific hardware and software 
configuration information is kept. Settings applicable to each logged-in
 user are maintained in this section.

There are some important subkeys below this key:

**HARDWARE**
This section contains information about the hardware devices connected to the system.

**SAM**
This section contains the encrypted versions of the passwords of the users.

**SECURITY**
It is the section that contains the security policies in the system.

**SOFTWARE**
This section contains the configurations of the operating system services as well as the programs installed in the system.

**SYSTEM**
It is the section where the configuration information of the system is kept.

**HKEY_CURRENT_CONFIG or HKCC**
It is the section that keeps the hardware configurations during the operation of the system.

**HKEY_CLASSES_ROOT or HKCR**
It contains software settings, shortcuts, and all other user 
interface-related information. If this partition is deleted, none of the
 files will open, even if Windows is running.

**HKEY_CURRENT_USER or HKCU**
This is the section where the configurations of the logged-in user are kept.

**HKEY_USERS or HKU**
It is the section where the configurations of all users registered to the system are kept.

**Reg extension files**

Files with the “Reg” extensions are the file format saved when exporting
 the registry files. The structure of the “Reg” extension which is a 
text-based file type, is as follows:

For example, let's export the “Computer Name” as a “reg” extension file 
type through the registry and open and read it with the notepad:

As seen in the screenshot above, the subkey with the “Computer Name” was found, exported, and saved to the file.

When we accessed the saved file, the computer name in the registry was read successfully.

**Registry Operations on the Command Line**

Many operations that can be executed with the registry editor program 
can also be executed via the command line. Reading registry keys and 
values, writing values ​​to the registry, and exporting and importing 
keys are some of the operations that can be executed via the command 
line. For example, let's read the computer name we saved in the file in 
the previous practice from the registry using the command line:

As seen in the screenshot above, the computer name was successfully read
 from the registry with the command "reg query 
HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ComputerName".
 There is more information at the following link on the other operations
 on the registry via the command line:

**Reg Command:** https://ss64.com/nt/reg.html

We have covered the Windows registry, its structure, how it is accessed,
 what the "reg" extension files are, and the importance of the Windows 
registry in terms of security in this part of the training. We will 
cover “Windows Firewall” in the next part of our training.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg2.png)

- HKEY_LOCAL_MACHINE or HKLM
- HKEY_CURRENT_CONFIG or HKCC
- HKEY_CLASSES_ROOT or HKCR
- HKEY_CURRENT_USER or HKCU
- HKEY_USERS or HKU
- HKEY_PERFORMANCE_DATA (only in Windows NT, but invisible in the Windows Registry Editor)
- HKEY_DYN_DATA (only in Windows 9x, and visible in the Windows Registry Editor)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg555.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/reg6.png)

