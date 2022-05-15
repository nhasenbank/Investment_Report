#!/bin/bash

## start cron service
cron

## create envfile for runscript
echo "
export STARTSCRIPT=$STARTSCRIPT
export RUNSCRIPT=$RUNSCRIPT
export TARGETSCRIPT=$TARGETSCRIPT   
export LOGFILE=$LOGFILE    
" | envsubst >> /opt/scripts/cron.env

## echo current cron configuration to the logfile
touch $LOGFILE
cat /opt/crontab | grep -v '#'| ts '[%Y-%m-%d %H:%M:%S]' >> $LOGFILE

## follow the logfile as docker doreground process
tail -f $LOGFILE