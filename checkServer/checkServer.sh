#!/bin/bash
#
# OK, so how does this work?
# It assumes you already have my run as a service script installed (check the repo)
# You'll need to change the paths to the Crash dumps if you've installed it somewhere else
# it checks the install directory for crashDumps
# if it finds one it assumes server down, writes to a few logs files, stops server, removes crash dumps and restarts
#
# how to run this every x minutes?
# crontab -e (this opens your crontab on AWS Linux and a few other varients)
# to run it every minute add the line:
# * * * * * cd /minecraft/ && sh checkServer.sh

if ls /minecraft/pe/Crash* 1> /dev/null 2>&1; then
    now="$(date)"
    echo "Current date and time %s\n" "$now" >> srvChk.log
    echo "crash log files found" >> srvChk.log 
    /etc/init.d/minecraftpe stop >> srvChk.log
    rm -f /minecraft/pe/minecraftPE.Locked >> srvChk.log
    /etc/init.d/minecraftpe start >> srvChk.log
    rm -f /minecraft/pe/Crash* >> srvChk.log
    echo "restart server" >> srvChk.log
fi


