#!/bin/sh
######################################################
######################################################
a=1
PING_LIST=ping_list.txt
LOGFILE=log/"ping_"`date +"%Y%m%d"`.log
echo "#########################################" >> $LOGFILE

while [ $a -le 10 ]
do
  echo "####################################################"
  while read line
  do
    date +"%Y/%m/%d %T" >> $LOGFILE
    /bin/ping -w 1 -c 1 $line >> $LOGFILE
    if [ $? -eq 0 ] ; then
      TIME=`date +"%Y/%m/%d %T"`
      echo -e ${TIME} "\tOK:" ${line}
    else
      TIME=`date +"%Y/%m/%d %T"`
      echo -e ${TIME} "\t\033[1;31mNG\033[0;39m:" ${line}
      #sleep 1
    fi
  done < $PING_LIST
  sleep 1
done
