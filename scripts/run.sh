#!/bin/bash

## source mandetory environment vars
. /opt/scripts/cron.env

## switch to workdir
cd /opt

## execute python script
echo "Run $TARGETSCRIPT" | ts '[%Y-%m-%d %H:%M:%S]' >> $LOGFILE
/opt/venv/bin/python $TARGETSCRIPT 2>&1 | ts '[%Y-%m-%d %H:%M:%S]' >> $LOGFILE
echo "Finish $TARGETSCRIPT" | ts '[%Y-%m-%d %H:%M:%S]' >> $LOGFILE