@echo off
git.exe init  
git.exe config gitflow.branch.master main                                                                                      
git.exe config gitflow.branch.develop develop
git.exe config gitflow.path.hooks .git/hooks
git.exe flow init -f -d --feature="feature/" --bugfix="bugfix/" --release="release/" --hotfix="hotfix/" --support="support/" --tag="version/"

