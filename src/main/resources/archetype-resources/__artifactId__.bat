@echo off
if not exist %~dp0config\properties.bat (
  mkdir %~dp0config 1>nul 2>&1
  echo @rem put your properties here. >> %~dp0config\properties.bat
  echo warning: check your settings in %~dp0config\properties.bat before first run.
  exit
)
call %~dp0config\properties.bat
java -cp "%~dp0config;%~dp0target\classes;%~dp0target\dependency\*" foobar.AppMain %*

