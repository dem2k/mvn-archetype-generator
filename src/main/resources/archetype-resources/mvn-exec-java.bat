@call mvn exec:java -Dexec.mainClass="dem2k.AppMain" -Dexec.args="%*"
@if errorlevel 1 pause
