@call mvn exec:java -Dexec.mainClass="foobar.AppMain" -Dexec.args="%*"
@if errorlevel 1 pause
