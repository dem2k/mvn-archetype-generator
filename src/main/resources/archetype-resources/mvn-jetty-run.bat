@SET ROOT=xtest
@SET PORT=8080
SET MAVEN_OPTS=-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=5%PORT%,server=y,suspend=n
SET MAVEN_CMD=mvn -DskipTests -Djetty.reload=automatic -Djetty.scanIntervalSeconds=5 -Djetty.port=%PORT% -Djetty.contextPath=/%ROOT% jetty:run
@TITLE JETTY %MAVEN_CMD%
@START "" http://localhost:%port%/%root%/application.wadl
@CALL %MAVEN_CMD%
@IF ERRORLEVEL 1 PAUSE
@REM -Djetty.scanIntervalSeconds=5
@REM    The pause in seconds between sweeps of the webapp to check for changes and automatically hot redeploy if any are detected. By default this is 0, which disables hot deployment scanning. A number greater than 0 enables it.
@REM -Djetty.reload=automatic
@REM    Default value is "automatic", used in conjunction with a non-zero scanIntervalSeconds causes automatic hot redeploy when changes are detected. Set to "manual" instead to trigger scanning by typing a linefeed in the console running the plugin. This might be useful when you are doing a series of changes that you want to ignore until you're done. In that use, use the reload parameter.
