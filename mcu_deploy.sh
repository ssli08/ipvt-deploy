#!/bin/bash
mcuDir=/opt/mcu/release
deployDir=/opt/mcu

dateExt=`date +%F`
file=$1

if [[ -d $mcuDir ]];then
	
	kill -9 `pidof gs_avs`
	mv $mcuDir $mcuDir-$dateExt
else	
	tar zxf $deployDir/$file.tar.gz -C $deployDir
	cd $mcuDir && ./gs_avs &
	sleep 10
	echo `$mcuDir/mcudump ver|awk '{print $3}'`
	
fi
