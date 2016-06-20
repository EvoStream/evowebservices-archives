@echo off

echo creating installation folder in %SystemDrive%\node_evowebservices\.... 
IF NOT EXIST %SystemDrive%\node_evowebservices\ MKDIR %SystemDrive%\node_evowebservices\

echo changing directory to %SystemDrive%\node_evowebservices\......
CD %SystemDrive%\node_evowebservices\

echo getting evowebservices on github...
call npm install --save https://github.com/EvoStream/evowebservices/tarball/master

echo changing directory to evowebservices....
cd node_modules\evowebservices

echo installing pm2....
call npm install pm2 -g

echo starting evowebservices using pm2....
call pm2 start app.js

call pm2 list
echo.
echo.
echo ---------------------------------------------------------------------
echo Open your node command prompt and enter pm2 commands to check the status of running process of evowebservices
echo.
echo pm2 commands:
echo List all running processes:
echo call pm2 list
echo.
echo Stop an app:
echo call pm2 stop 0
echo.
echo Restart an app:
echo call pm2 restart 0
echo.
echo To view detailed information about an app:
echo call pm2 show 0
echo.
echo To remove an app from PM2’s registry:
echo call pm2 delete 0
echo.
pause >nul