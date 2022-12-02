function runcmd($cmd){
    if ($cmd) {
        Write-Host "Starting IDE :", $cmd.definition
        & $cmd "."
        sleep -Seconds 5
        exit
    }
}
runcmd (Get-Command "$env:scoop\apps\idea\current\IDE\bin\idea64.exe" -ErrorAction SilentlyContinue)
runcmd (Get-Command idea64 -ErrorAction SilentlyContinue)
runcmd (Get-Command idea -ErrorAction SilentlyContinue)
$regstr = (Get-ItemProperty registry::HKEY_CLASSES_ROOT\Applications\idea.exe\shell\open\command)."(default)"
runcmd ((($regstr -replace '%1', '') -replace '"','').Trim())
Write-Error "IDE Not Found"
sleep -Seconds 5
