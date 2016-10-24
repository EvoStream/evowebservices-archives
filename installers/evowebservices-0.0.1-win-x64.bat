@echo off

echo creating installation folder in node_evowebservices\.... 
IF NOT EXIST node_evowebservices MD node_evowebservices

echo changing directory to node_evowebservices\......
CD node_evowebservices

echo getting evowebservices on github...
call npm install --save https://github.com/EvoStream/evowebservices/tarball/master-azure

echo changing directory to evowebservices....
cd node_modules\evowebservices

echo starting evowebservices using npm....
call npm start

echo.
echo EVOWEBSERVICES INSTALLED ON %cd%\node_evowebservices\node_modules\evowebservices
echo PRESS ANY KEY TO EXIT. 
echo.
pause >nul