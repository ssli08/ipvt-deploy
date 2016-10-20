#!/bin/bash
#read -p 'upload file:' file
#init_size=`ls -l $file |awk '{print $5}'`
#last_size=`ls -l $file |awk '{print $5}'`

projectDir=/home

inotifywait -mrq -e close_write --format %f "$projectDir"|while read file
do
cd $projectDir
#wput $file ftp://test:pass@192.168.121.201/log/ssli/
#echo $file

done

