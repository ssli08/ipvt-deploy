#!/bin/bash
#read -p 'upload file:' file
#init_size=`ls -l $file |awk '{print $5}'`
#last_size=`ls -l $file |awk '{print $5}'`

projectDir=/home
destDir=/opt/mcu/

deploy(){
	ansible-playbook /opt/ipvt-deploy/copy.yml -e "package=$file" 
}


inotifywait -mrq -e close_write --format %f "$projectDir"|while read file
do
cd $projectDir
#wput $file ftp://test:pass@192.168.121.201/log/ssli/
#echo $file

deploy 

#if [[ ! -d $destDir ]];then
#	cd $destDir && tar zxf $file
#else
#	rm -r $destDir/release && tar zxf $file
#	
#fi
	

done

