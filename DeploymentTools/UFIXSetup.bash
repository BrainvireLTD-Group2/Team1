#!/bin/bash
clear
# Check if PWD is already a UFIX project.
if [ -d "sources" ]; then
  echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
  echo -ne ":: Warning\n\n\n"
  echo -ne ":: A project already exists in this directory!\n"

  echo -n "Do you want to overwrite this project (y/n)?"
  read answer

  if [ "$answer" != "${answer#[Yy]}" ] ;then
    clear
    echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
    echo -ne ":: Removing Existing Project\n"
    rm -rf sources UFIX.exe
	sleep 1
  else
    clear
    echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
    echo -ne ":: New Project Directory\n\n\n"
	echo -ne ":: Creating a new project in " $PWD ".\n"
	echo -ne ":: Please type in a project name, this will be the working folder for this project:\n"
	read NEWDIR
	mkdir $NEWDIR
    cd $NEWDIR
  fi
fi

# Utility stuff

NO_COLOR='\033[0m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

BoardingDir="Boarding-System"
DisciplinaryDir="Disciplinary-System"
LeaveDir="Leave-System"
PayrollDir="Payroll-System"
PIMDir="PIM-System"
RecruitmentDir="Recruitment-System"
AdminDir="System-Administration"
UfixDir="Ufix-Program"

PROJECT_SETUP=($BoardingDir $DisciplinaryDir $LeaveDir $PayrollDir $PIMDir $RecruitmentDir $AdminDir $UfixDir)

# Pre script checks.

clear

clear
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Pre setup checks.\n\n\n"
echo -ne ":: Checking if ${YELLOW}Git${NO_COLOR} is intalled...\n\n"
sleep 0.5

if command -v git; then
	clear
    echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
    echo -ne ":: Pre setup checks.\n\n\n"
	echo -ne ":: ${YELLOW}Git is installed.${NO_COLOR}\n\n"
	sleep 1
else
	clear
    echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
    echo -ne ":: Pre setup checks.\n\n\n"
	echo -ne ":: ${CYAN}Git is not installed.${NO_COLOR}\n"
	echo -ne ":: Please install Git 2.xx.x before running this script.\n"
	echo -ne ":: ${YELLOW}https://git-scm.com/downloads${NO_COLOR}\n\n"
	exit 0
fi

clear

# Git Clone modules into working directory.
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Downloading individual modules.\n"
sleep 0.5
echo -ne ":: Downloading files into:${YELLOW}" $PWD "${NO_COLOR}\n\n\n\n"
sleep 0.5

echo -ne ":: Downloading: ${YELLOW}Ufix-Program${NO_COLOR}         \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Ufix-Program

echo -ne ":: Downloading: ${YELLOW}Payroll-System${NO_COLOR}       \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Payroll-System

echo -ne ":: Downloading: ${YELLOW}Recruitment-System${NO_COLOR}   \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Recruitment-System

echo -ne ":: Downloading: ${YELLOW}System-Administration${NO_COLOR}\r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/System-Administration

echo -ne ":: Downloading: ${YELLOW}Leave-System${NO_COLOR}         \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Leave-System

echo -ne ":: Downloading: ${YELLOW}Boarding-System${NO_COLOR}      \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Boarding-System

echo -ne ":: Downloading: ${YELLOW}Disciplinary-System${NO_COLOR}   \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/Disciplinary-System

echo -ne ":: Downloading: ${YELLOW}PIM-System${NO_COLOR}            \r\c\n"
git clone -q https://github.com/BrainvireLTD-Group2/PIM-System

sleep 1
clear

# Start removing unnessecary files.
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Cleaning...\n\n\n\n"

for Working in "${PROJECT_SETUP[@]}"
do
	echo -ne ":: Cleaning: ${YELLOW}" $Working "${NO_COLOR}                    \r\c\n"
	cd $Working
	rm -rfv .idea *.md .git
	cd ..
	sleep 0.05
done

sleep 1
clear

# Start setting up project structure.
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Setting up the project...\n\n\n\n"

for Working in "${PROJECT_SETUP[@]}"
do
	if [ $Working = $UfixDir ]; then
		break
	fi

	echo -ne ":: Setting up: ${YELLOW}" $Working "${NO_COLOR}                        \r\c\n"
	cp -rfv $Working $UfixDir
	sleep 0.25
done

sleep 1
clear

# Start additional cleaning procedure.
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Cleaning...\n\n\n\n"

for Cleaning in "${PROJECT_SETUP[@]}"
do
	if [ $Cleaning = $UfixDir ]; then
		break
	fi

	echo -ne ":: Cleaning: ${YELLOW}" $Cleaning "${NO_COLOR}                          \r\c\n"
	rm -rfv $Cleaning
	sleep 0.25
done

sleep 1
clear

# Start preparing project for building. 
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Preparing project structure...\n\n\n\n"
sleep 0.3

cd $UfixDir
rm -fv LICENSE
rm -fv .gitignore
sleep 1

if [ "$(ls -A $AdminDir)" ]; then
    echo -ne "[clWorker] Object: $AdminDir Op: moving required files.							                      \n"
    cd $AdminDir
	mv -v UfixAccounts.sqlite3 ../../
	cd DeploymentTools
	mv -v UFIX.exe ../../../
	cd ..
	rm -rfv DeploymentTools
	cd ..
	mv $AdminDir system
else
    echo -ne  "[Warning] $AdminDir is empty... deleting.								                              \n"
	rm -rfv $AdminDir
fi

sleep 1

if [ "$(ls -A $BoardingDir)" ]; then
    echo -ne  "[clWorker] Object: $BoardingDir Op: moving required files.							                  \n"
	mv -v $BoardingDir boarding
else
    echo -ne  "[Warning] $BoardingDir is empty... deleting.								                              \n"
	rm -rfv $BoardingDir
fi

sleep 1

if [ "$(ls -A $DisciplinaryDir)" ]; then
    echo -ne  "[clWorker] Object: $DisciplinaryDir Op: moving required files.                                         \n"
	mv $DisciplinaryDir disciplinary
else
    echo -ne  "[Warning] $DisciplinaryDir is empty... deleting.                                                       \n"
	rm -rfv $DisciplinaryDir
fi

sleep 1

if [ "$(ls -A $LeaveDir)" ]; then
    echo -ne  "[clWorker] Object: $LeaveDir Op: moving required files.							                      \n"
	mv -v $LeaveDir leave
else
    echo -ne  "[Warning] $LeaveDir is empty... deleting.								                              \n"
	rm -rfv $LeaveDir
fi

sleep 1

if [ "$(ls -A $PayrollDir)" ]; then
    echo -ne  "[clWorker] Object: $PayrollDir Op: moving required files.							                  \n"
	mv -v $PayrollDir payroll
else
    echo -ne  "[Warning] $PayrollDir is empty... deleting.								                              \n"
	rm -rfv $PayrollDir
fi

sleep 1

if [ "$(ls -A $PIMDir)" ]; then
    echo -ne  "[clWorker] Object: $PIMDir Op: moving required files.							                      \n"
	mv -v $PIMDir pim
else
    echo -ne  "[Warning] $PIMDir is empty... deleting.								                                  \n"
	rm -rfv $PIMDir
fi

sleep 1

if [ "$(ls -A $RecruitmentDir)" ]; then
    echo -ne  "[clWorker] Object: $RecruitmentDir Op: moving required files.							              \n"
	mv -v $RecruitmentDir recruitment
else
    echo -ne  "[Warning] $RecruitmentDir is empty... deleting.								                          \n"
	rm -rfv $RecruitmentDir
fi

sleep 1

cd ..

sleep 1

echo -ne  "[clWorker] Creating sources directory.							                                          \n"
mv -v $UfixDir python
mkdir -v sources
mv -v python ./sources

echo -ne  "[clWorker] Creating executable.							                                                  \n"

sleep 1

clear

echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Project setup completed.\n"
echo -ne ":: Run the ${YELLOW}UFIX.exe${NO_COLOR} file to run the program.\n"
echo -ne ":: Run this script again to update.\n\n\n\n"

read -n 1 -s -r -p ":: Press any key to exit."
clear
