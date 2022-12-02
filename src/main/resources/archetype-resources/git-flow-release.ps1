Set-StrictMode -Version Latest

function Main {
    $xml = Select-Xml -XPath /ns:project/ns:version -Path pom.xml -Namespace @{ns = "http://maven.apache.org/POM/4.0.0" } 
    $VerArray = $xml.Node.InnerText -split "\."
    $vMajor = $VerArray[0]
    $vMinor = $VerArray[1]
    $vBuild = ($VerArray[2] -split "-")[0]
    $isSnapshot = $xml.Node.InnerText -like "*-snapshot"
    $nVersion = Format-Version $vMajor $vMinor $vBuild $isSnapshot

    $Answer = Read-Host ("`n => Update POM Version: {0} to {1} (Y/n) " -f $xml.Node.InnerText, $nVersion)
    if ($Answer -eq "y" -Or $Answer -eq "Y" -Or $Answer -eq "") {
        Write-Host "`nGitflow starting..."
        Run-GitFlow $vMajor $vMinor $vBuild $isSnapshot
        Sleep 1
        & "mvn" versions:set "-DnewVersion=$($nVersion)" versions:commit
        Sleep 1
        Dir changelog.* | foreach { & "notepad.exe" $_ | Wait-Process }
        Sleep 1
        $msg = if ($isSnapshot) { "Release: $nVersion" } else { "Version: $nVersion" }
        Run-GitCommit $msg
    }
}

function Run-GitFlow ($vMajor, $vMinor, $vBuild, $isSnapshot) {
    & "git" status
    $action = if ($isSnapshot) { "start" } else { "finish","-m","Release $vBuild" }
    & "git" flow release $action ("v{0}.{1}.{2}" -f $vMajor, $vMinor, $vBuild)
    if (!$?) {
        Pause
        Exit 1
    }
}

function Run-GitCommit ($msg) {
    & "git" status
    $Answer = Read-Host "`n => Check your changes. Commit? (option '-a' is active) (Y/n) "
    if ($Answer -eq "y" -Or $Answer -eq "Y" -Or $Answer -eq "") {
        Write-Host ""
        & "git" commit -a -m "$msg"
    }
}

function Format-Version($vMajor, $vMinor, $vBuild, $isSnapshot) {
    if ($isSnapshot -eq $false) {
        $vBuild = "{0}-SNAPSHOT" -f (1 + $vBuild)
    }
    return "{0}.{1}.{2}" -f $vMajor, $vMinor, $vBuild
}

Main

Write-Host "`n => Don't forget to PUSH all Branches with TAGS!`n"

Pause
