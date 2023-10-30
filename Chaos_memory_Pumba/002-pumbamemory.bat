@echo off

REM Allocate about 150M of memory
SET MEM_TO_ALLOCATE=150M

echo Stressing memory for busybox victims using Pumba

REM Use Pumba to stress the memory of all victim containers simultaneously
docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock gaiaadm/pumba stress --duration 250s --stressors "vm 1 --vm-bytes %MEM_TO_ALLOCATE%" busybox-victim-1 busybox-victim-2 busybox-victim-3 busybox-victim-4 busybox-victim-5