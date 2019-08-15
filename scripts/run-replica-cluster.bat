:: Run a mongodb replica-cluster 
ECHO OFF

:: Define variables
set STARTLOG=start.txt

:: Run
ECHO Starting mongodb replica-cluster > %STARTLOG%

START /WAIT TASKKILL /F /IM mongod.exe
START "Mongodb Master - replicaSet0" C:\mongodb\mongod.exe.lnk --port 27017 --replSet replicaSet0 >> %STARTLOG%
START "Mongodb Slave - replicaSet0" C:\mongodb\mongod.exe.lnk --port 27018 --replSet replicaSet0 >> %STARTLOG%
START "Mongodb Arbiter - replicaSet0" C:\mongodb\mongod.exe.lnk --port 27019 --replSet replicaSet0 >> %STARTLOG%
ECHO mongod.exe.lnk executed on port 27017(Master), 2018(Slave), 27019(Arbiter) - Replica name: replicaset0 >> %STARTLOG%

PAUSE
