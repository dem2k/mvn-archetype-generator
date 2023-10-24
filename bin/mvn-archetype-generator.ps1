param($ProjectName)

if (-not $ProjectName ) {
	$ProjectName = (Read-Host "`n => Please enter Project Name (this is the maven artifactId) ").Trim()
}

if ($ProjectName -eq "") {
	Write-Error "Project Name can not be empty."
	Exit
}

Write-Host "Starting maven archetype plugin..."
& mvn archetype:generate -DarchetypeGroupId="dem2k" -DarchetypeArtifactId="simple-archetype" -DinteractiveMode="false" -DgroupId="foobar" -DartifactId="$ProjectName" -Dversion="0.1.1-SNAPSHOT"

cd $ProjectName
# wget.exe "https://gitignore.io/api/java,maven" -O .gitignore

# === GitIgnore ===
@'
# Created by https://www.toptal.com/developers/gitignore/api/java,maven

### Java ###
# Compiled class file
*.class

# Log file
*.log

# Package Files
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# virtual machine crash logs
hs_err_pid*
replay_pid*

### Maven ###
/target
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
pom.xml.next
release.properties
dependency-reduced-pom.xml
buildNumber.properties
.mvn/timing.properties
.mvn/wrapper/maven-wrapper.jar

# Eclipse generated files
.project
.classpath

# End of https://www.toptal.com/developers/gitignore/api/java,maven

/my-*
/gh-*
/git-*
/mvn-*
/xx-*
/zz-*
/.idea
/config
'@ >> .gitignore

$Answer = Read-Host "`n => Initialize Git-Flow? (Y/n) "
if ($Answer -eq "y" -Or $Answer -eq "Y" -Or $Answer -eq "") {
        & "./git-flow-init.bat"
}

