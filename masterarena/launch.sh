#!/bin/bash

X :2 -config ./dummy-1920x1080.conf &

./steamcmd-guardian.sh

#DISPLAY=:2 wine server/Binaries/Redist/UE3Redist.exe /S /SILENT /VERYSILENT /QUIET &
#sleep 15

cp ./run_server.bat ./server/
mkdir ./server/UDKGame/
mkdir ./server/UDKGame/Config/
cp ./UDKMAMapList.ini ./server/UDKGame/Config/
cd ./server/
DISPLAY=:2 wine cmd < run_server.bat
