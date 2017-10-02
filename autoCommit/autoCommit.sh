#!/bin/sh
echo Begin Autocommit >> /minecraft/autocommit.log
date >> /minecraft/autocommit.log
git add --a >> /minecraft/autocommit.log
git commit -m 'autocommit!' >> /minecraft/autocommit.log
git push origin master --force >> /minecraft/autocommit.log
echo DONE >> /minecraft/autocommit.log
