#!/bin/bash
#
# This script will stop/start your pocketmine server using the runAsService script from
# https://bitbucket.org/davecozens/pocketminescripts
# you need to replace *PASSWORD* with your rcon password in pocketmine
# which is set in server.properties in the pocketmine directory
# you might want to change the log file location too...
# TODO: Add the password and paths into variables..
# other assumption: you've got mcrcon installed...
# i got it from: http://sourceforge.net/projects/mcrcon/
echo "Server reboot at $(date)" >> /home/daniel/Minecraft-PE/srvChk.log
/home/daniel/Minecraft-PE/./mcrcon -P 25575 -H 127.0.0.1 -p 123 "broadcast Server scheduled reboot in 10 seconds"
sleep 7
/home/daniel/Minecraft-PE/./mcrcon -P 25575 -H 127.0.0.1 -p 123 "broadcast Server scheduled reboot in 3 seconds"i
sleep 3
/home/daniel/Minecraft-PE/./mcrcon -P 25575 -H 127.0.0.1 -p 123 "broadcast Server scheduled reboot in NOW"
/etc/init.d/minecraftpe stop
echo "Stopped at $(date)" >> /home/daniel/Minecraft-PE/srvChk.log
sleep 10
rm -r -f /home/daniel/Minecraft-PE/minecraftPE.Locked 
echo "log removed at $(date)" >> /home/daniel/Minecraft-PE/srvChk.log
/etc/init.d/minecraftpe start
echo "Restart complete at $(date)" >> /home/daniel/Minecraft-PE/srvChk.log
