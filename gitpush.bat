@echo off

title GIT one key commit tool
color 3
echo Current pwd is：%cd%
echo;

echo Begin add changes：git add .
git add .
echo;

set /p declation=inputcommit message:
git commit -m "%declation%"
echo;

git push origin develop
echo;
