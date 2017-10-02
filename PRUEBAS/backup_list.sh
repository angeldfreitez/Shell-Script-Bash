#!/bin/bash

backup_dir="/home/daniel/Minecraft-PE/"
destiny="/home/daniel/Backup/titantower-backup-rar"
fecha=`date +%y-%m-%d`

#==================
	cp /home/daniel/Minecraft-PE/white-list.txt /home/daniel/Backup/lista
	cp /home/daniel/Minecraft-PE/ops.txt /home/daniel/Backup/lista
	sleep 2
#	zip -r "listas.zip" /home/daniel/Backup/lista
#	sleep 4
#	echo holaaa
#	mv listas.zip /home/daniel/Backup/listas
#==================
	cd /home/daniel/Backup/lista

	git add .
	git commit -m "prueba"
	git push origin master