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
	rm -rf .idea *.md .git
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
	cp -rf $Working $UfixDir
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
	rm -rf $Cleaning
	sleep 0.25
done

sleep 1
clear

# Start preparing project for building. 
echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Preparing project structure...\n\n\n\n"
sleep 0.3

cd $UfixDir
rm -f LICENSE
rm -f .gitignore
sleep 0.3
cd $AdminDir
cd DeploymentTools
mv UFIX.exe ../../../
cd ..
rm -rf DeploymentTools
cd ..
sleep 0.3
mv $BoardingDir boarding
sleep 0.3
mv $DisciplinaryDir disciplinary
sleep 0.3
mv $LeaveDir leave
sleep 0.3
mv $PayrollDir payroll
sleep 0.3
mv $PIMDir pim
sleep 0.3
mv $RecruitmentDir recruitment
sleep 0.3
mv $AdminDir system
sleep 0.3
cd ..
mv $UfixDir python
mkdir sources
mv python ./sources
sleep 0.3
sleep 1
clear

echo -ne ":: ${YELLOW}UFIX Project Setup\n${CYAN}==============================================================\n\n${NO_COLOR}"
echo -ne ":: Projcet setup completed.\n"
echo -ne ":: Run the ${YELLOW}UFIX.exe${NO_COLOR} file to run the program.\n"
echo -ne ":: Run this script again to update.\n\n\n\n"

read -n 1 -s -r -p ":: Press any key to exit."
clear
