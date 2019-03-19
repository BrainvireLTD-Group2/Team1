# Deployment Help

***

## How do I compile an executable file?
You can use the following tools to download all the GitHub projects and compile them into an executable:

## UFIXSetup.bash
Will download everything from the GitHub and move it into one working directory "sources" and create an executable called UFIX.exe. You will need to run this in ***Git Bash*** as it *will **NOT*** work in the Windows command line.

To use this script use the command `bash UFIXSetup.bash` provided you are in the directory where the UFIXSetup.bash file is located.

***
Once everything has finished downloading using UFIXSetup.bash, you can launch the program using the UFIX.exe file.

## Something's Wrong!
You'll need to make sure your program accounts for directory handling as the file structure will be setup like this:
```
.
├── sources
│   └── python
|       |
│       ├── boarding
|       |
│       ├── disciplinary
|       |
│       ├── leave
|       |
│       ├── payroll
|       |
│       ├── pim
|       |
│       ├── recruitment
|       |
│       └── system
```

`system` is the main directory for the program. The `UFIX.exe` file will launch the mainGUI.py script in `system` - which will show the login page.

You need to make sure when you are calling other people's code or files for whatever reason within your python script you need to account for this folder structure. It maybe worth running this script to create a test environment for your code.

**If you have any other errors regarding modules, or other errors - please contatct any of the System Administration team ASAP**

**Contact info for the System Administration team can be found on Blackboard in the file "GitHub Handout.pdf"**
