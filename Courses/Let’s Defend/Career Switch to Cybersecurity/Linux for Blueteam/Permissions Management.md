---
tags:
  - linux
  - linux-fundamentals
  - permissions-management
  - course/lets-defend
---

# Permissions Management


**File permissions**

On Linux, each file has permissions. With these permissions, users are 
authorized to access related files. Management of file permissions is 
very important for security. The permissions of the files that each user
 needs to access and the permissions of the user-specific files are 
different.

The "ls -l" command is used to see the permissions of the files. For 
example, let's see the permissions of the files under the "training" 
directory:

In the image above, file permissions are shown in the leftmost column. File permissions have a unique representation:

This display is divided into 4 areas: file type, user permissions, group
 permissions, and other permissions, respectively. For example: d | rwx |
 rwx | rwx 

On the far left, the file type is expressed first. If it says "d" in 
this section, it means that it is a directory. If there is a “-” sign, 
it means that the file exists. The representation of the remaining 3 
fields consists of the expressions “r,w,x,-”. The meanings of these 
expressions are as follows:

r : readablew : writablex : executable- : emptyThere is also a numerical representation of 
file permissions. The letter equivalent of the file permissions shown in
 the example above consists of 3 bits each. The expression “rwx” 
consists of 3 bits.

In this notation, each r,w,x expression has a numerical equivalent:

4: read permission(r)2: write permission(w)1: execute permission(x)

Both letter and numeric notation can be used to change file permissions.

**Changing File Permissions**

The "chmod" command is used when changing file permissions. The chmod 
command basically needs two parameters. The first of these is the 
parameter that contains information about the permission change. This 
parameter specifies which permission will be changed and whose 
permission will be changed. The second parameter is the file that the 
permissions need to be changed. For example, let's first see the 
permissions of the file “letsdefend.jpg”:

You can use this interactive shell for practice:

As seen in the image above, the file permissions are "r w - r - - r - 
-". The user has read(r) and write(w) privileges on this file, but not 
execute(x) privileges. Let's give the user execute(x) permission with 
the chmod command:

As seen in the image above, execute(x) permission has been granted to 
the file “letsdefend.jpg” with the chmod command. The first parameter in
 the command is the "u+x" parameter. In this section, the letter “u” 
indicates that the privileges of the user will be changed. The “+” sign 
indicates the change type. The “+” sign is used to authorize, if the “-”
 sign was used, it would mean revoking the existing authorization. The 
“x” sign indicates which type of authorization is used. Since "x" is 
included in this example, the execute permission has been changed. 
Instead of "x"(execute), it could be changed to "w"(write) or "r"(read).

For this example, the numeric values of the file's privileges before and after the change are as follows:

Before the Change: 

r w - r - - r - -   :  6 4 4

r w -   :   110 (binary)
r w -   :   6 (numeric)
r - -    :   100 (binary)
r - -    :    4 (numeric)

After the Change:

r w x r - - r - -   :  7 4 4

r w x   :   111 (binary)
r w x   :    7 (numeric)
r - -    :   100 (binary)
r - -    :    4 (numeric)

There is another method for making authorization changes. In this 
method, numerical values of authorizations are used. It is possible to 
change more authorizations with shorter commands compared to the 
previous method. In the first parameter in the command in the previous 
method, the numerical equivalent of the authorizations of the change 
made this time is written. For example, let's take back the execute(x) 
authorization given in the previous example, using a numeric value:

 

As seen in the image above, we have taken back the execute(x) 
authorization by giving the numerical value of the authorization to the 
chmod command.

**Ownership Permissions**

In Linux, each file has an owner as user and group. Ownership 
information can be viewed with the "ls -l" command. For example, let's 
see the ownership information of the file “letsdefend.jpg”:

As seen in the image above, the owner of the file is the "debian" user. 
The owner as a group is also the "debian" group. The "chown" command is 
used to change the owner of the file. For example, let's change the 
owner of the file "letsdefend.jpg" to the user "letsdefend":

As seen in the image above, the owner of the file has been changed to the "letsdefend" user with the chown command. 

In the output of the "ls -l" command, the name on the left refers to the
 user. The one on the right represents the owner group. Since the owner 
group of the file has not been changed, in the example above, the group 
remains as "debian". If we want to change the owner group, the command 
we need to apply is the "chgrp" command. For example, let's change the 
group of the file "letsdefend.jpg" to "letsdefend":

As seen in the image above, the group of the file has been changed to the "letsdefend" group.

Since the "chown" and "chgrp" commands are commands that can run with 
the permissions of the authorized user (root), they have been used 
together with the "sudo" command in the examples above. Details about 
the “sudo” command are covered later in the training.

In this part of the training, information about file permissions and 
changing file permissions is given. The next part of the training 
describes users and groups.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/perm1.png)

- r : readable
- w : writable
- x : executable
- : empty

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/perm2.png)

- 4: read permission(r)
- 2: write permission(w)
- 1: execute permission(x)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/izin9.png)

