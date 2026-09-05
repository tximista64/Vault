---
tags:
  - linux
  - linux-fundamentals
  - package-management
  - course/lets-defend
---

# Package Management


**Package and Package Management**

The package is the downloadable files in the repositories of the 
distribution to install an application on Linux from the command line or
 the Graphical User Interface (GUI). The repositories contain 
installable packages of applications. It is almost the easiest way to 
install applications on Linux. Each Linux distribution can have a 
different repository. The desired application can be installed with the 
package manager installed on Linux, as well as the removal of 
applications from the system can be done with package managers. To 
install the application with the package manager, the installable file 
of the relevant application must be found in the system's repository. 
Applications that are not included in the repository must be downloaded 
and installed into the system.

Since the examples in this training are implemented on debian, the package manager of debian is used as the package manager.

Linux distributions such as Debian, Ubuntu, and Linux Mint use the same 
package manager. Linux distributions such as Red Hat Enterprise Linux, 
Fedora, and CentOS use a different package manager.

Redhat-like distributions use the "RPM (RPM Package Manager)" package 
manager. Debian-based distributions use the "APT" package manager. The 
file extension for the RPM package manager is “.rpm”. The file extension
 for the APT package manager is “.deb”.

**APT Source List**

When installing packages on Linux, it downloads the file from a specific
 source. Linux has to know where to download the file. The APT package 
manager has a source list that it uses to download files. This list, 
which is saved in a file on Linux, is located in 
"/etc/apt/sources.list". Let's look at the contents of this file:

As seen in the image above, the addresses from which the packages will 
be downloaded are written in the "/etc/apt/sources.list" file on the 
system.

**Updating Packages for a Repository**

Packages in the repositories are constantly updated. In order to install
 the newly added packages to the system, the packages in the repository 
must first be updated. For example, this update can be done as follows:

**Updating Packages Installed on the System**

There may be updates to the packages installed on the system. "apt-get 
upgrade" command is used to install new versions of existing packages to
 the system.

When the command is executed, a list of packages that need to be updated is displayed.

At the bottom of the list, the area to be covered on the system after 
the update is given. Finally, a question is asked whether it is desired 
to continue the process. If confirmation is given, the update is made, 
if not, the transaction is canceled.

**Installing a package from a repository with APT Package Manager**

Packages can be installed on the system with the APT package manager. Let's install the "chromium" browser app:

As seen in the image above, the command used to install the chromium application on the system has been written.

When the command is executed, the names of the packages to be installed 
are specified. Information about the area to be covered on the system is
 given. Once the requested confirmation is given, the installation is 
successful.

**List Installed Packages on the System**

The "dpkg" command is used to see the packages installed on the system. 
For example, let's see the packages installed on the system:

As seen in the image above, the "-l" parameter is given to the "dpkg" 
command. When this command is run, a list of installed packages will 
appear:

Note: Since the output is too long, only the beginning part is shown.

As can be seen in the image above, the output of the installed packages 
has been displayed. Information about installed packages can be obtained
 from this section.

As seen in the image above, the "chromium" application installed in the previous example is seen in the list.

**Remove a Package with APT Package Manager**

It is possible to delete the packages installed on the system with the 
APT package manager. Let's delete the "chromium" application installed 
in the example above:

As seen in the image above, the command used to remove the "chromium" application from the system has been written.

When the command is executed, the details of the operations to be 
performed are given to the user for approval. When the requested 
approval is given, the application is successfully removed from the 
system.

**Getting information about an installed package**

It is possible to get detailed information about the packages installed 
in the system in Linux. For example, let's get information about the 
"firefox" browser installed in the system:

As seen in the screenshot above, we can see the detailed information 
about the firefox web browser by typing the “apt” command and the “show”
 parameter followed by the name of the package for which information is 
requested.

**Installing a Package with dpkg**

It is possible to download and install packages on Linux externally. The
 extension of such files should be “.deb”. Files with the “.deb” 
extension can be uploaded to the system with “dpkg”. Let's install the 
"hwinfo" tool from the file with the extension ".deb":

First of all, the relevant package is downloaded from the website. Then,
 the installation is carried out with the "dpkg" command in the 
directory where the downloaded file is located.

As seen in the image above, the tool named “hwinfo” has been 
successfully installed on the system by giving the “-i”(install) 
parameter to the “dpkg” command.

**Removing a package with dpkg**

It is possible to remove the packages installed on the system with 
"dpkg". For example, let's remove the "hwinfo" tool installed in the 
previous example from the system:

As seen in the image above, the "hwinfo" tool has been successfully 
removed from the system with "dpkg". The “-r”(remove) parameter 
indicates that it will be removed from the system.

Note: When deleting a package from the system with "dpkg", the name of 
the package should be written as it is in the "dpkg -l" output.

In this part of the training, package management issues such as package 
installation and deletion are discussed. Service management is explained
 in the next part of the training.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/package15.png)

