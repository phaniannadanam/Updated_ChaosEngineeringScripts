@echo off

FOR /L %%i IN (1,1,5) DO (
    echo Creating victim container: busybox-victim-%%i
    docker run -d --name busybox-victim-%%i stressng-image
)