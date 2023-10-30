@echo off
SETLOCAL ENABLEDELAYDEXPANSION

FOR /L %%i IN (1,1,3) DO (
    echo Creating PauseVictim#%%i
    docker run -itd --name PauseVictim%%i ubuntu:latest
    echo Creating PauseVictim#%%i DONE!!!
)

FOR /L %%i IN (1,1,2) DO (
    echo Creating KillVictim#%%i
    SET CONTAINER_NAME=KillVictim%%i
    docker run -itd --name KillVictim%%i ubuntu:latest
    echo Creating KillVictim#%%i DONE!!!
)

ENDLOCAL
