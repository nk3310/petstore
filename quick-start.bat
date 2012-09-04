@echo off
echo [Pre-Requirement] Makesure install JDK 6.0+ and set the JAVA_HOME.
echo [Pre-Requirement] Makesure install Maven 3.0.4+ and set the PATH.

set MVN=mvn
set MAVEN_OPTS=%MAVEN_OPTS% -XX:MaxPermSize=128m

echo [Step 1] Install all springside modules to local maven repository.
cd modules
call %MVN% clean install -Dmaven.test.skip=true
if errorlevel 1 goto error
cd ..\
pause

echo [Step 2] Generate Eclipse project files for all projects.
call %MVN% eclipse:clean eclipse:eclipse
if errorlevel 1 goto error
pause

goto end

echo [Step 3] Initialize schema and data for all example projects.
cd examples
call %MVN% antrun:run -Prefresh-db
if errorlevel 1 goto error
cd ..\
pause

echo [Step 4] Start all example projects.
cd examples\petstore
start "petstore" %MVN% clean jetty:run 
if errorlevel 1 goto error

cd ..\..\
pause

echo [INFO] Please wait a moment. When you see "[INFO] Started Jetty Server" in both 2 popup consoles, you can access below demo sites:
echo [INFO] http://localhost:8080/petstore


goto end
:error
echo Error Happen!!
:end
pause