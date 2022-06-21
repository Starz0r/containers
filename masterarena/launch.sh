#!/bin/bash

X :2 -config ./dummy-1920x1080.conf &

./steamcmd-guardian.sh

#DISPLAY=:2 wine server/Binaries/Redist/UE3Redist.exe /S /SILENT /VERYSILENT /QUIET &
#sleep 15

cp ./run_server.bat ./server/
mkdir -R ./server/UDKGame/Config/DedicatedServer1
cp ./UDKMapList.ini ./server/UDKGame/Config/DedicatedServer1/
cd ./server/
DISPLAY=:2 wine cmd < run_server.bat
