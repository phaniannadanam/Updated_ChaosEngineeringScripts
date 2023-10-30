@echo off

REM Allocate about 1.5GiB for each victim
SET MEM_TO_ALLOCATE=1500M

FOR /L %%i IN (1,1,5) DO (
    SET CONTAINER_NAME=busybox-victim-%%i
    CALL :StressContainer
)
GOTO :eof

:StressContainer
start cmd /c docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock gaiaadm/pumba stress ^
--duration 250s ^
--stressors "--vm 1 --vm-bytes %MEM_TO_ALLOCATE% --vm-keep" %CONTAINER_NAME%
GOTO :eof