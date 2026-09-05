---
tags:
  - linux
  - linux-fundamentals
  - command-line
  - course/lets-defend
---

# Basic Terminal Commands - 2


**mv Command**

The mv command is the command used to rename and move files. With the mv command, we can change the file name as follows:

As seen in the image above, first, the old file name is written as a 
parameter after the mv command. As the second parameter, the new file 
name is written.

In file transfer operations with the mv command, after the mv command, 
the path where the source file is located is given as the first 
parameter, and the destination path is given as the second parameter. 
For example, let's move the "movedfile" file under the "soc" directory 
to the directory named "incident":

As seen in the image above, the file named "movedfile" in the "soc" 
directory under the home directory has been moved to the directory named
 "incident" under the home directory.

**cp Command**

The cp command is the command used in file/directory copy operations. 
The first parameter in the cp command is the path of the file/directory 
to be copied. The second parameter is the target path. For example, 
let's copy the "copyfile" file under the "incident" directory to the 
"soc" directory:

It is possible to copy nested directories with the cp command. The "-r" 
parameter should be used for this operation. For example, let's copy the
 "directory4" directory under the "soc" directory to the "incident" 
directory:

As seen in the image above, when the cp command is executed without the 
“-r” parameter, a warning will appear stating that there is a directory 
under the target directory. When the missing parameter is added and the 
command is applied, the directory copying process is completed 
successfully.

**rm Command**

The rm command is the command used to delete files and directories. For 
example, let's delete the file "file1" under the "soc" directory:

As seen in the image above, the file "file1" was given as a parameter to the rm command and the deletion was successful.

When deleting directories with the rm command, the "-r" parameter should
 be used additionally. For example, let's delete the directory named 
"directory1" under the "soc" directory:

As seen in the image above, the "directory1" directory was successfully deleted by using the rm command with the "-r" parameter.

**cat Command**

The cat command is the command used for reading from the file. The path 
of the file to be read is given as a parameter. For example, let's read 
the file named "message":

As seen in the image above, the content of the file named "message" has been successfully printed on the screen.

**echo Command**

The echo command is the command used for printing to the screen. For 
example, let's print "BlueTeam" to the screen with the echo command:

You can use this interactive shell for practice:

When the echo command and redirection operators are used together, 
printing to the file can be done. These operators are the “>” and 
“>>” operators. The “>” operator prints the value of the 
parameter given to the echo command to the file in the parameter that 
follows it. For example, let's print the phrase "Hello Linux" in an 
empty file:

As seen in the image above, the phrase "Hello Linux" has been 
successfully written to the empty file named "note". If the target file 
content is full, the “>” operator deletes the existing text and 
prints the specified new expression to the file. For example, let's 
print "Hello SOC Analyst" to the same file this time:

As seen in the image above, the old text was deleted and the new text was written in its place.

When printing to a file with the “>” operator, if the target file 
does not exist, it is created and the content is saved in the created 
file.

If you want to keep the old text by adding to the end of the existing 
file content, the “>>” operator should be used. For example, let's
 do additional printing to the file used in the example above:

As seen in the image above, the old text and the new text can be found together.

**more Command**

The more command is a command that allows reading the contents of long 
files. For example, let's read the file named “wordlist.txt” with the 
“more” command:

After executing the more command, an environment where we can examine interactively opens:

In this section, the beginning of the file content is on the screen. The
 expression “%” in the lower-left indicates which part of the file is 
read as a percentage. There are two conveniences for reading in this 
interactive environment. These are the "Enter" and "Space" keys on the 
keyboard. The file can be read by scrolling down line by line with the 
"Enter" key. A new page comes up with the "Space" button.

Pressing the "q" key is sufficient to exit the interactive environment that opens with the application of “more” command.

**wc Command**

The wc command is a command that counts the number of lines, the number 
of words and the number of characters in the file content. For example, 
let's see the total number of lines in the file named “wordlist.txt”:

As seen in the image above, we learned the total number of lines in the 
file content by using the wc command with the "-l" parameter.

Let's see the total number of words in the same file:

As seen in the image above, we learned the total number of words in the 
file content by using the wc command with the "-w" parameter. The reason
 why the total number of lines in the previous example and the total 
number of words in this example are the same is that there is one word 
in each line in the file.

Let's see the total number of characters in the same file:

As seen in the image above, we learned the total number of characters in
 the file content by using the wc command with the "-m" parameter.

**head Command**

The head command is the command used to see the lines at the beginning 
of the file. The “-n” parameter of the head command allows to see any 
number of lines. For example, let's see the first 5 lines of the file 
named “wordlist.txt”:

As seen in the image above, we successfully printed the first 5 lines on the screen.

**tail Command**

The tail command is the command used to see the lines at the end of the 
file. The "-n" parameter of the tail command allows to see the desired 
number of lines. For example, let's see the last 5 lines of the file 
named “wordlist.txt”:

As seen in the image above, we have successfully printed the last 5 lines on the screen.

**grep Command**

The grep command is a command to search within a file. The word/words to
 be searched are given as parameters. For example, let's see the lines 
containing the word "letsdefend" in the file named "wordlist.txt":

As seen in the image above, the lines containing the word "letsdefend" 
in the "wordlist.txt" file were successfully printed on the screen.

**sort Command**

The sort command is the command to sort the contents of the file 
alphabetically. For example, let's have a file named "list" like the one
 below:

Let's sort the contents of the "list" file alphabetically with the sort command and print it to the screen:

As can be seen in the image above, the file content has been successfully sorted alphabetically.

**uniq Command**

The uniq command is used to reduce successive same values ​​to a single 
value in the file content. For example, let's execute the uniq command 
on the "list" file:

As can be seen in the image above, the consecutive word "investigation" 
was printed on the screen once and the command ran successfully. If all 
repetitive words, including all non-sequential words in the file 
content, are wanted to be printed on the screen once, sorting should be 
done first by applying the sort command, and then the uniq command 
should be applied. It is possible to do all these operations with a 
single command. "|"(pipe) sign should be used to perform this operation 
with a single command. The pipe(“|”) sign allows you to give the output 
of one command as input to another command. Pipe(“|”) gives the output 
of the command on the left as input to the command on the right. For 
example, let's use the "|"(pipe) sign on the "list" file:

As can be seen in the image above, all the repeating words in the "list"
 file were merged into one and successfully printed on the screen.

**date Command**

The date command is the command that displays the system's date and time.

**uptime Command**

The uptime command is the command that shows how long the system has been up.

As seen in the image above, the system has been operating for 18 hours and 43 minutes.

**history Command**

The history command is the command that shows the history of commands 
executed on the command line. For example, let's execute the history 
command:

As seen in the image above, the last command applied is the history 
command, and there were 1474 applied commands. Because the command 
history is long, only the last commands are shown. While the History 
command is running, it reads the list of commands executed from a file 
and prints it to the screen. This file is the ".bash_history" file that 
is hidden under the user's home directory. Obtaining the command history
 from this file is very important for linux host analysis. Based on 
which commands are executed in the system, attack can be detected and 
important clues about the attacker can be obtained. For example, 
critical information such as the IP address of the command and control 
server that the attacker used to send commands to the system can be 
found in the command history. It is recommended that the SOC analyst 
carefully review this file.

**find Command**

The find command is the command used in file searches. With the find 
command, you can find out whether the searched file exists under a 
certain directory. For example, let's see if the file named "message" 
exists under the "training" directory:

As seen in the image above, the file named "attack", which is a 
non-existent file, was searched and could not be found. Then the file 
named “message” was searched and found. It is also possible to search 
for a specific file type with the find command. For this, the "-type" 
parameter should be used. For example, let's see if the directory named 
"letsdefend" exists under the "training" directory:

As seen in the image above, it was specified that a directory(d) type 
search will be made for the type parameter. The searched directory was 
found successfully.

**file Command**

The file command is the command that shows the file type. In Linux, file
 extensions are represented. It is the header information of the file 
that determines the file type. The file command determines the file type
 according to the header information and prints it to the screen. For 
example, let's look at the type of file "letsdefend.txt":

As seen in the image above, although the file extension is ".txt", the 
file is not a text file, the type of the file is seen as "JPEG".

In this part of the training, the basic commands are explained with some
 practices. The commands described have many parameters. If necessary, 
it is recommended to examine the parameters of the commands from the man
 pages. The next part of the training explains file permissions.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal23.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal24.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal25.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal26.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal27.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal28.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal29.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal30.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal31.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal32.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal33.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal34.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal35.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal36.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal37.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal38.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal39.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal40.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal41.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal42.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal43.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal44.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal45.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal46.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal47.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal48.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal49.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal50.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal51.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal52.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/terminal53.png)

