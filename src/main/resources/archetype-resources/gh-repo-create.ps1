$repo = $pwd | Split-Path -Leaf
$ansr = read-host "About to create GitHub Repository [$repo]. Continue or type in new Name? "
if ($ansr -ne "") { $repo = $ansr }
if ((git.exe remote -v | measure).count -gt 0) { 
    write-host "git remote already exists:"
    git.exe remote -v
    write-host "`n enter will overwrite origin!"
    pause
}
git.exe remote -v remove origin >$null 2>&1
gh.exe repo create $repo --source=$pwd --public
pause
