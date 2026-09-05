---
tags:
  - windows
  - filesystem
  - course/lets-defend
---

# Windows Filesystems


**What is File System?**
A file system is a data structure that maintains the order of digital 
storage areas, and whose unit is a file. The operating system cannot 
make sense of the spaces on the disk without the file system. It cannot 
know which data group is on the disk as a file. So the file system is a 
very important component for running the operating system. File systems 
have different types and data structures. This data structure can be 
different for each file system.

**File Systems Used in Windows**
File systems have also been developed, like every technology that has 
developed from the past to the present. With the development of 
technology, the need for new file systems has emerged due to increased 
processing power and storage capacity. Therefore, different file systems
 have been developed continuously and released to the market. Some of 
these file systems used in Windows operating systems are given below.

**1. FAT**
The File Allocation Table (FAT) file system was developed and released 
for personal computers in 1977. Although the purpose of its emergence 
was to be used on floppy disks, it was adapted to be used in hard drives
 and other devices over time. The FAT file system is not the default 
file system for Microsoft Windows operating systems today. Today, it is 
used in USB flash drives, flash drives, and other embedded systems.

**2. exFAT**

exFAT (Extensible File Allocation Table) is a file system introduced by 
Microsoft in 2006 and optimized for flash memory such as USB flash 
drives and SD cards.

(Source: Wikipedia)

**3. NTFS**

New Technology File System (NTFS) was announced and started to be used 
with the Windows NT 3.1 version in 1993. It was used as the default file
 system within the Windows operating system with this version and it 
still is. It replaced FAT file system as it is a more advanced file 
system that is suitable for new technologies. In addition, the NTFS file
 system also supports Linux and BSD systems.

It is of great importance for SOC analysts to know the technical details
 of the NTFS file system considering that it is predominantly used in 
Windows operating systems as the latest technology today. Knowing the 
structure of the file system ensures that the security-oriented 
inferences to be obtained in the analyses are more and more consistent 
for analysts who perform host analysis. In order to have further 
information on this topic, detailed information can be obtained by 
conducting research under the name of "Filesystem Forensics".

We covered what the file system is and the file systems used in Windows 
in this part of the training. We will explain the “Directory Structure” 
subject in the next part of our training.

