#!/bin/bash

#VARIABLES 
exec 2>/dev/null
VERSION= #set version number here
PROCESS=`/bin/ps -ef|grep messenger.$VERSION | grep -v grep | awk '{print $8}'`
FILE=`/bin/ls /usr/bin/custom/messenger.*`

#CHECK
if [[ -e "$PROCESS" ]]; then
   echo "OK"
   exit 0
elif [[ -e "$FILE" ]]; then
   echo "Warning - File and Process versions mismatch"
   exit 1
else
   echo "Critical - File does not exist"
   exit 2
fi
