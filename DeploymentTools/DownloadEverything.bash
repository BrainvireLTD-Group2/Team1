#!/bin/bash

BoardingDir="Boarding-System"
DisciplinaryDir="Disciplinary-System"
LeaveDir="Leave-System"
PayrollDir="Payroll-System"
PIMDir="PIM-System"
RecruitmentDir="Recruitment-System"
AdminDir="System-Administration"
UfixDir="Ufix-Program"

clear

echo -ne ":: Downloading individual modules.\n"
sleep 0.5
echo -ne ":: Cloning files into:" $PWD "\n\n\n"
sleep 0.5

echo -ne "\nCloning: Ufix-Program                     ------------------------   (0%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Ufix-Program

echo -ne "Cloning: Payroll-System                   ###---------------------  (12%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Payroll-System

echo -ne "Cloning: Recruitment-System               ######------------------  (25%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Recruitment-System

echo -ne "Cloning: System-Administration            #########---------------  (38%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/System-Administration

echo -ne "Cloning: Leave-System                     ############------------  (50%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Leave-System

echo -ne "Cloning: Boarding-System                  ###############---------  (63%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Boarding-System

echo -ne "Cloning: Disciplinary-System              ##################------  (75%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/Disciplinary-System

echo -ne "Cloning: PIM-System                       #####################---  (88%)\r\c"
git clone -q https://github.com/BrainvireLTD-Group2/PIM-System

echo -ne "Done!                                     ######################## (100%)\r\c"
sleep 1
clear

echo -ne ":: Cleaning...\n\n\n\n"

echo -ne "Cleaning: Payroll-System                  ###---------------------  (12%)\r\c"
cd $PayrollDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: Recruitment-System              ######------------------  (25%)\r\c"
cd $RecruitmentDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: System-Administration           #########---------------  (38%)\r\c"
cd $AdminDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: Leave-System                    ############------------  (50%)\r\c"
cd $LeaveDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: Boarding-System                 ###############---------  (63%)\r\c"
cd $BoardingDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: Disciplinary-System             ##################------  (75%)\r\c"
cd $DisciplinaryDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Cleaning: PIM-System                      #####################---  (88%)\r\c"
cd $PIMDir
rm -rf .idea
rm -rf *.md
rm -rf .git
cd ..

echo -ne "Done!                                     ######################## (100%)\r\c"
sleep 1
clear

echo -ne ":: Setting up the project...\n\n\n\n"

echo -ne "Setting up: Payroll-System                ###---------------------  (12%)\r\c"
cp -rf $PayrollDir $UfixDir

echo -ne "Setting up: Recruitment-System            ######------------------  (25%)\r\c"
cp -rf $RecruitmentDir $UfixDir

echo -ne "Setting up: System-Administration         #########---------------  (38%)\r\c"
cp -rf $AdminDir $UfixDir

echo -ne "Setting up: Leave-System                  ############------------  (50%)\r\c"
cp -rf $LeaveDir $UfixDir

echo -ne "Setting up: Boarding-System               ###############---------  (63%)\r\c"
cp -rf $BoardingDir $UfixDir

echo -ne "Setting up: Disciplinary-System           ##################------  (75%)\r\c"
cp -rf $DisciplinaryDir $UfixDir

echo -ne "Setting up: PIM-System                    #####################---  (88%)\r\c"
cp -rf $PIMDir $UfixDir

echo -ne "Done!                                     ######################## (100%)\r\c"
sleep 1
clear

echo -ne ":: Cleaning...\n\n\n\n"

echo -ne "Cleaning: Payroll-System                  ###---------------------  (12%)\r\c"
rm -rf $PayrollDir

echo -ne "Cleaning: Recruitment-System              ######------------------  (25%)\r\c"
rm -rf $RecruitmentDir

echo -ne "Cleaning: System-Administration           #########---------------  (38%)\r\c"
rm -rf $AdminDir

echo -ne "Cleaning: Leave-System                    ############------------  (50%)\r\c"
rm -rf $LeaveDir

echo -ne "Cleaning: Boarding-System                 ###############---------  (63%)\r\c"
rm -rf $BoardingDir

echo -ne "Cleaning: Disciplinary-System             ##################------  (75%)\r\c"
rm -rf $DisciplinaryDir

echo -ne "Cleaning: PIM-System                      #####################---  (88%)\r\c"
rm -rf $PIMDir

echo -ne "Done!                                     ######################## (100%)\r\c"
sleep 1
clear

echo -ne ":: Finished setting up Ufix-Program project\n\n"
read -n 1 -s -r -p ":: Press any key to exit."
clear
