---
tags:
  - windows
  - windows-fundamentals
  - filesystem
  - course/lets-defend
---

# Directory Structure


**What is Directory Structure?**
As in every operating system, the folder and file structure in Windows 
takes place in a certain order from the first installation. This order 
is determined by the company/person that developed the operating system.

Although windows versions have similar folder structures in general, 
some folders and files may differ depending on the version of the 
operating system. The examples in this training are shown on the 
"Windows Server 2019 Datacenter".

In Windows, the root directory is **"drive:\"**, for example, the root directory is usually **"C:\"**.
 The directory separator is usually a "\", but the operating system also
 internally recognizes a "/". Physical and virtual drives are named by a
 drive letter, as opposed to being combined as one.

(Source: Wikipedia)

**Directories in Windows**
The directory structure is created as follows when Windows is first installed.

**1. PerfLogs**

It is the folder created to keep Windows performance logs. It is found 
as an empty folder because the logging option is turned off by default.

**2. ProgramData**

The ProgramData folder is located as a hidden folder under the root of 
the disk where the Windows operating system is installed. The "Hidden 
Items" option must be activated under the "View" menu first to be able 
to see the folder. There are data belonging to the programs installed in
 the system, independent from the user accounts in this folder.

You can see the contents of the "ProgramData" folder in the image above.

**3. Program Files**
All the programs installed in the system are located under the "Program 
Files" folder in a Windows operating system installed as 32-bit. In 
Windows operating systems installed as 64-bit, only 64-bit programs are 
installed under this folder.

You can see the contents of the "Program Files" folder in the image above.

**4. Program Files (x86)**
This folder is only available on Windows operating systems installed as **"64-bit"**. There are programs installed on the system as **"32-bit"** under this folder. Programs installed as "64-bit" are stored in another folder named “Program Files” with a similar name.

You can see the contents of the "Program Files (x86)" folder in the image above.

**5. Users**
The Users folder contains the personal folder of each user who has 
logged on to the system at least once. Folders and documents such as 
desktop folder, downloaded files, and documents are stored under this 
folder that belongs to each user on the system.

You can see the contents of the "Users" folder in the image above.

**6. Windows**

The Windows folder is where the entire operating system is installed. It
 has its own structure and it contains many systemic information in a 
certain order. For example, the database where users' passwords are kept
 is located under this folder.

You can see the contents of the **"Windows"** folder in the image above.

This section examined Windows's directory structure and looked at the 
directories that are created during installation. In the next section, 
we provide a practical explanation of the command line.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Windows+Fundamentals/images/dir6.png)

