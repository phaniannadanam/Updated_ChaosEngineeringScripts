@echo off

FOR /L %%i IN (1,1,5) DO CALL :CreateContainer %%i

REM End of the main script
GOTO :EOF

:CreateContainer
echo Creating Victim #%1
SET CONTAINER_NAME=busybox-victim-%1
docker run -itd --name %CONTAINER_NAME% ubuntu:latest
echo Creating %CONTAINER_NAME% DONE!!!

REM Install stress-ng inside the container
docker exec -it %CONTAINER_NAME% apt-get update
docker exec -it %CONTAINER_NAME% apt-get install -y stress-ng
GOTO :EOF