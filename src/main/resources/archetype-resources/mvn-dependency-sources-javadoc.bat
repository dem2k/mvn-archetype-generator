@call mvn dependency:sources dependency:resolve -Dclassifier=javadoc
@if errorlevel 1 pause
