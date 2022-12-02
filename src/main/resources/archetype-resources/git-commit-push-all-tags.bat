@echo off
git.exe status
echo.
pause
echo.
git.exe commit -a
git.exe push origin --all
git.exe push origin --tags
echo.
pause
