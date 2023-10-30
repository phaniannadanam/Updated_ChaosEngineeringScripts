@echo off
FOR /L %%i IN (1,1,2) DO (
    echo Pausing KillVictim%%i
    docker pause KillVictim%%i
)

FOR /L %%i IN (1,1,3) DO (
    echo Killing PauseVictim%%i
    docker kill PauseVictim%%i
    timeout /t 30
)
