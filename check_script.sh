#!/bin/sh
######################################################
######################################################
a=1
URL_LIST=url_list.txt

while [ $a -le 10 ]
do
  echo "###############################################"
  while read line
  do
#   result=`wget -nv --spider --timeout 1 --tries=1 ${line} 2>&1`
#   TIME=`echo $result | cut -d " " -f 1-2`

    wget -nv -q --spider --timeout 1 --tries=1 ${line} 2>&1
    if [ $? -eq 0 ] ; then
      TIME=`date +"%Y-%m-%d %T"`
      echo -e ${TIME} "\tOK:" ${line}
    else
      TIME=`date +"%Y-%m-%d %T"`
      echo -e ${TIME} "\t\033[1;31mNG\033[0;39m:" ${line}
    fi
  done < $URL_LIST
  sleep 1
done
