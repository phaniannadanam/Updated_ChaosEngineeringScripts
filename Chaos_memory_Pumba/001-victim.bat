@echo off

FOR /L %%i IN (1,1,5) DO (
    echo Creating Victim #%%i
    docker run -itd --name busybox-victim-%%i ubuntu:latest
    echo Creating busybox-victim-%%i DONE!!!
)
