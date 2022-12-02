param($ProjectName)

if (-not $ProjectName ) {
	$ProjectName = (Read-Host "`n => Please enter Project Name (this is the maven artifactId) ").Trim()
}

if ($ProjectName -eq "") {
	Write-Error "Project Name can not be empty."
	Exit
}

Write-Host "Starting maven archetype plugin..."
& mvn archetype:generate -DarchetypeGroupId="dem2k" -DarchetypeArtifactId="simple-archetype" -DinteractiveMode="false" -DgroupId="dem2k" -DartifactId="$ProjectName" -Dversion="0.1.1-SNAPSHOT"

cd $ProjectName
wget.exe "https://gitignore.io/api/java,maven" -O .gitignore

# === GitIgnore ===
@'
/my-*
/gh-*
/git-*
/mvn-*
/xx-*
/zz-*
/.idea
'@ >> .gitignore

$Answer = Read-Host "`n => Initialize Git-Flow? (Y/n) "
if ($Answer -eq "y" -Or $Answer -eq "Y" -Or $Answer -eq "") {
        & "./git-flow-init.bat"
}
