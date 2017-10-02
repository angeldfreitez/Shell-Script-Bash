#!/bin/bash

backup_dir="/home/daniel/Minecraft-PE/"
destiny="/home/daniel/Backup/titantower-backup-rar"
fecha=`date +%y-%m-%d`

cp -r $backup_dir $destiny/$fecha
echo preparandose para comprimir
sleep 2
zip -r $fecha.zip $destiny/$fecha/
sleep 1
echo terminado
mv $fecha.zip $destiny/

cd $destiny

git add *
git commit -m "Backup de prueba a la fecha:: $fecha"
git push origin master