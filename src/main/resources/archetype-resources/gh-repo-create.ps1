$repo = Split-Path -Path . -Leaf
$ans = read-host "About to create GitHub Repository [$repo]. Enter new Name? "
if ($ans -ne "") { $repo = $ans }
if ((git remote -v | measure).count -gt 0) { 
    write-host "git remote already exists:"
    git remote -v
    write-host "`n enter will overwrite origin!"
    pause
}
git remote -v remove origin >$null 2>&1
gh.exe repo create $repo --source=$pwd --public
pause
