---
tags:
  - linux
  - linux-fundamentals
  - command-line
  - course/lets-defend
---

# Basic Terminal Commands - 1


**What is the Command Line?**

The command line is an intermediary program that receives commands from 
the user via the keyboard and transfers the commands to the operating 
system for execution. The command line in Linux is called "shell". There
 are many types of shells supported on Linux.

In this training, "bash" is used as the shell type and “Debian” is used as the Linux distribution.

When a command line window is opened on Debian, the following window pops:

**Command Line Structure**

When the command line window is opened, we see a structure with a cursor
 waiting for a command from the user. This structure is as follows:

username@hostname:current_directory$

In this structure, the part before the "@" sign represents the username.
 The part from the "@" sign to the ":" sign represents the hostname. The
 part from the “:” to the “$” sign indicates which directory it is being
 worked on. The "$" sign on the far right is the last element in this 
structure. In the command line of the root user, who is the most 
authorized user in the system, the "#" sign is used instead of the "$" 
sign at the end of this structure.

So far, we have tried to get to know Linux, what the command line is, 
and its components. Now, we are ready to use the Linux command line and 
execute the commands. Before applying the basic commands, we need to 
learn those commands that Linux offers us. There are too many commands 
and parameters on Linux and it is not possible, and not necessary, for 
us to keep all these commands in mind. It is sufficient for us to see 
and learn detailed information about the commands in case needed.

**whatis Command**

The whatis command allows us to view a single line of brief information 
about commands running on the command line. For example, let's execute 
the whatis command itself together with the whatis command:

As you can see in the screenshot above, we printed the one-line description of the whatis command to the screen.

**help Command**

The help command is one of the information commands that gives a more 
detailed output than the whatis command. For example, let's look at the 
help output of the "cd" command, which allows us to change the 
directory:

We can see the parameters and explanations of the cd command on the screenshot above.

**man Command**

The man command is the command that provides the most detailed 
information about the commands and programs on the command line. It has a
 specific writing format. It offers very detailed content from 
descriptions to parameters. For example, let's see the man page of the 
whatis command:

**pwd Command**

The pwd command stands for "print working directory". It is the command 
that shows the working directory. For example, let's run the pwd command
 and see the output:

As seen in the command output, the pwd command output is "/home/debian/training".

You can use this interactive shell for practice:

**cd Command**

The cd command is the command to switch between directories. It stands 
for "change directory". When switching between directories with the cd 
command, the path of the target directory must be specified. There are 
two methods for specifying this path:

**a. Absolute Path**

Absolute path is a notation written to indicate all subdirectories from 
the root directory ("/") to the current directory. For example, let's 
say our current directory is “/home/debian/training/” and let's go to 
the directory named “letsdefend” with the cd command. Let's give 
absolute path when executing the cd command:

As seen in the image above, the directory has been changed by giving 
absolute path to the cd command. The change in the path section on the 
command line has been seen.

**b. Relative Path**

Relative path, unlike absolute path, is to write the part after the 
current directory instead of typing the full path of the directory to be
 traversed from the root directory(“/”). If we apply the above example 
using relative path, we need to execute the command as follows:

In both examples shown above, the same directory change was made, but 
two different methods were used as a method. These methods may not be 
practical sometimes and needed to apply shorter directory change 
commands. In this case, there are some conveniences that can be applied.

**Changing directory with current directory (".") sign**

The “.” sign indicates the current directory. For example, let's say the
 directory we are in is “/home/debian/training/”. To change the 
directory with the “.” sign, the command should be executed as follows:

Here, our current directory in the absolute path is “.”, and we did the same directory change operation with a shorter command.

**d. Changing directory with parent directory (“..”) sign**

With the ".." (parent directory) sign, we can switch to a parent 
directory of the current directory. For example, let our current 
directory be “/home/debian/training/letsdefend” and move to the parent 
directory “/home/debian/training/” with the parent directory (“..”) 
sign:

As seen above, since the ".." parent directory sign means a parent 
directory of the current directory, we could easily switch to a higher 
directory with a short command.

**e. Switching to the home directory with the home directory (“~”) sign**

With the "~" (home directory) sign, it is possible to switch to the home
 directory of the current user. For example, let our current directory 
be “/home/debian/training/” and change to the user's home directory with
 the “~” sign:

As seen in the image above, we have provided the change to the home directory with the "~" sign.

**f. Switching to the last directory with the Previous directory sign (“-”)**

With the “-” (previous directory) sign, it is possible to switch to the 
previous directory, regardless of which directory it is. For example, 
let our current directory be “/home/debian/” and move to the previous 
directory with a “-” sign:

 

As seen in the image above, we were able to switch to the previous 
directory with the "-" sign. The target directory does not need to be a 
parent or a child directory when changing the directory with this sign. 
It can be any directory. If the same command is applied again (cd -) it 
will change to the previous directory “/home/debian/”:

**ls Command**

The ls command is the command to list directories and files. With this 
command, directories and files under a directory can be viewed. It is 
one of the most important commands. It can have a very functional use 
with its parameters. For example, let's run the ls command in the 
"/home/debian/training/" directory and see the directories and files 
under it:

As seen in the image above, there are 2 files and 1 directory under the "/home/debian/training/" directory.

If we use the ls command without giving any parameters, it will list the
 current directory. If we give a different directory, it will list in 
the directory we have given:

As seen in the image above, a listing has been made in the "/home/debian/training/letsdefend/" directory.

**a. Viewing hidden files and directories with the ls command**

The ls command does not show hidden files when used without parameters. 
In order to see hidden files, the ls command must be given the "-a" 
parameter:

The difference between the display of hidden files and normal files is 
the "." sign in the beginning. As seen in the image above, hidden files 
were not displayed when the ls command was used without the "-a" 
parameter.

**b. Getting detailed information about directories and files with the ls command**

When the ls command is used with the "-l" parameter, it provides 
detailed information about the files/directories it lists. This 
information includes the permissions of the file/directory, the owner of
 the file/directory the name of the user, the owner of the 
file/directory the name of the group, the size of the file/directory, 
the date the file/directory was last modified, and the name of the 
file/directory. For example, let's execute the command in the 
"/home/debian/training/" directory:

As seen in the image above, we have obtained detailed information about 
the files/directories. In this list form, the permissions of the 
file/directory can be seen in the first part (far left).

File permissions are very important in Linux. File permissions will be explained later in the training.

**c. Using multiple parameters with the ls command**

It is possible to obtain the desired output by using more than one 
parameter while executing the ls command. For example, we can use the 
"-a" and "-l" parameters together to see detailed information about both
 regular and hidden files:

**touch Command**

The touch command is the command to create a new empty file via the command line.

As seen in the image above, the directory was found to be empty with the
 "ls" command. A new empty file named “newfile” was created with the 
touch command. The output of the "ls" command shows that our file was 
created successfully.

**mkdir Command**

The mkdir command is the command to create a new directory. It stands for "make directory".

As seen in the image above, the mkdir command was used to create a 
single directory with a single parameter. It is possible to create 
multiple directories at once with the mkdir command:

As seen in the image above, multiple directories can be created at the 
same time with a single mkdir command. It is possible to create nested 
directories with the mkdir command. Nested directories can be created 
when the mkdir command is used with the "-p" parameter:

As seen in the image above, the "directory5" directory in the "directory4" directory was created with the "-p" parameter.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal8.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal9.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal10.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal11.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal12.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal13.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal14.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal15.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal16.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal17.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal18.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal19.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal20.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal21.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal22.png)

