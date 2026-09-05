---
tags:
  - linux
  - linux-fundamentals
  - compression
  - course/lets-defend
---

# Archive File Formats



It is possible to compress and archive files individually or along with 
many other files on Linux. It is important what the archive file types 
are and how the compression processes are performed for software that is
 usually downloaded and installed over the internet.

**Compressing files with gzip**

gzip is one of the tools to save storage space by compressing files. For
 example, let's compress the "wordlist.txt" file with gzip:

As seen in the image above, the "wordlist.txt" file has been compressed 
with the gzip command. When compressing with the gzip command, “.gz” is 
added to the file extension. Files compressed with gzip are known by 
this extension. It is also seen that there is a significant decrease in 
the size of the file before and after compression.

**Decompressing gzip files**

The "gunzip" command is used to open gzip-compressed files. For example,
 let's decompress the file we compressed in the previous thread:

As you can see in the image above, the file has been successfully 
restored to its original uncompressed state. There is no multi-file 
support for file compression with the gzip command. Compressing with 
gzip is done on a single file.

**Creating archives with tar**

The tar command allows multiple files to be archived as a single file. 
When the tar command is used alone, it doesn't compress, it just makes a
 single archive file. For example, let's turn the "wordlist.txt" and 
"wordlist2.txt" files into a single archive file with the tar command:

As seen in the image above, two files were turned into a single archive 
file with the tar command. The extension of files archived with the tar 
command is specified as “.tar”. The “c” parameter in the command 
indicates that there is an archive creation  operation. The “v” 
(verbose) parameter provides information to the user about whether the 
operation was successful or not. The “f” parameter is used to specify 
the name of the archive file to be created. If you want to compress the 
created file, the gzip command can be applied.

**Unpacking archives with tar**

Files that have been archived with the tar command can also be opened 
using the tar command. For example, let's open the "tarfile.tar" file 
that we created in the example above:

As seen in the image above, the archive file with the tar extension was 
successfully opened with the tar command. The "x" parameter in the 
command indicates that there is an extract operation.

**Creating zip files**

In Linux it is possible to create zip files on the command line. For 
example, let's turn "wordlist.txt" and "wordlist2.txt" into archive 
files with the "zip" command:

The zip file has been successfully created.

You can use this interactive shell for practice:

**Unzip files**

We can open zip files with the "unzip" command on the Linux command 
line. For example, let's open the "zipfile.zip" file created in the 
example above:

The zip file was successfully opened with the "unzip" command.

**Creating rar files**

It is possible to archive files as rar in Linux. For example, let's turn
 "wordlist.txt" and "wordlist2.txt" into archive files with the "rar" 
command:

As you can see in the image above, the rar file has been successfully 
created. The “a” parameter specifies that the archive will be added. In 
this way, the rar file is created.

**Unrar files**

In the Linux command line, we can open rar files with the "unrar" 
command. For example, let's open the "rarfile.rar" file created in the 
example above:

As seen in the image above, the rar file was successfully opened with 
the "unrar" command. The “e”(extract) parameter is the parameter used to
 open the archive. The commands used for archive files may not always be
 installed in the installed Linux operating system. If it is not already
 installed in our Linux package, we can install it on our system later 
on. Program installation and package management from the command line in
 Linux are explained in the later parts of the training.

In this part of the training, archive file types and operations on 
archive file types were explained. The next part of the training covers 
process management.

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive1.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive2.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive3.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive4.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive5.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive6.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive7.png)

![](https://ld-images-2.s3.us-east-2.amazonaws.com/Linux+for+Blue+Team/images/archive8.png)

