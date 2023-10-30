@echo off
SETLOCAL EnableDelayedExpansion

REM Apply stress using stress-ng concurrently on all containers
FOR /L %%i IN (1,1,5) DO (
    SET CONTAINER_NAME=busybox-victim-%%i
    echo Stressing CPU for !CONTAINER_NAME!
    
    REM Stress multiple components: CPU, IO, VM
    start /B docker exec !CONTAINER_NAME! stress-ng --cpu 16 --io 4 --vm 6 --vm-bytes 128M --timeout 540s
)

REM Pause the script to allow all background processes to complete
pause
