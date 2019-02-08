#!/bin/bash

BoardingDir="Boarding-System"
DisciplinaryDir="Disciplinary-System"
LeaveDir="Leave-System"
PayrollDir="Payroll-System"
PIMDir="PIM-System"
RecruitmentDir="Recruitment-System"
AdminDir="System-Administration"
UfixDir="Ufix-Program"

# downloading stuff
echo ">> Downloading Master Program."
git clone -v https://github.com/BrainvireLTD-Group2/Ufix-Program
echo ">> Downloading Payroll System Program."
git clone -v https://github.com/BrainvireLTD-Group2/Payroll-System
echo ">> Downloading Recruitment System Program."
git clone -v https://github.com/BrainvireLTD-Group2/Recruitment-System
echo ">> Downloading System Administration Program."
git clone -v https://github.com/BrainvireLTD-Group2/System-Administration
echo ">> Downloading Leave System Program."
git clone -v https://github.com/BrainvireLTD-Group2/Leave-System
echo ">> Downloading Boarding System Program."
git clone -v https://github.com/BrainvireLTD-Group2/Boarding-System
echo ">> Downloading Disciplinary System Program."
git clone -v https://github.com/BrainvireLTD-Group2/Disciplinary-System
echo ">> Downloading PIM System Program."
git clone -v https://github.com/BrainvireLTD-Group2/PIM-System
echo ">> Code base downloaded."
echo ">> Cleaning..."

# cleaning stuff
cd $BoardingDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $DisciplinaryDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $LeaveDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $PayrollDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $PIMDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $RecruitmentDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..
cd $AdminDir
rm -rfv .idea
rm -rfv *.md
rm -rfv .git
cd ..

# moving stuff
echo ">> Moving " $BoardingDir " to " $UfixDir "."
cp -rfv $BoardingDir $UfixDir
echo ">> Moving " $DisciplinaryDir " to " $UfixDir "."
cp -rfv $DisciplinaryDir $UfixDir
echo ">> Moving " $LeaveDir " to " $UfixDir "."
cp -rfv $LeaveDir $UfixDir
echo ">> Moving " $PayrollDir " to " $UfixDir "."
cp -rfv $PayrollDir $UfixDir
echo ">> Moving " $PIMDir " to " $UfixDir "."
cp -rfv $PIMDir $UfixDir
echo ">> Moving " $RecruitmentDir " to " $UfixDir "."
cp -rfv $RecruitmentDir $UfixDir
echo ">> Moving " $AdminDir " to " $UfixDir "."
cp -rfv $AdminDir $UfixDir

# cleaning stuff again
echo ">> Cleaning up..."
rm -rfv $BoardingDir
rm -rfv $DisciplinaryDir
rm -rfv $LeaveDir
rm -rfv $PayrollDir
rm -rfv $PIMDir
rm -rfv $RecruitmentDir
rm -rfv $AdminDir
echo ">> Done."
