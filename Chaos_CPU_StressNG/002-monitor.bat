@echo off
SETLOCAL EnableDelayedExpansion

REM Infinite loop for continuous monitoring
:loop
    echo -------------------------------------------
    REM For each of the victim containers
    FOR /L %%i IN (1,1,5) DO (
        SET CONTAINER_NAME=busybox-victim-%%i
        
        REM Use docker stats --no-stream to get the current CPU usage
        FOR /F "tokens=3" %%a IN ('docker stats !CONTAINER_NAME! --no-stream ^| findstr /v "NAME"') DO (
            echo CPU usage for !CONTAINER_NAME!: %%a
        )
    )
    REM Sleep for 5 seconds before the next iteration
    timeout /t 5 /nobreak
goto loop