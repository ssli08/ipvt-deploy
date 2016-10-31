#!/bin/bash
mcuDir=/opt/mcu/release
deployDir=/opt/mcu

dateExt=`date +%Y%m%d%s`
file=$1

pidFile=`pidof gs_avs`

untar(){
	mv $mcuDir $mcuDir-$dateExt
	tar zxf $deployDir/$file.tar.gz -C $deployDir
	cd $mcuDir && setsid ./gs_avs &
}

if [[ $pidFile != '' ]];then
	
	kill -9 `pidof gs_avs`
	untar;
	sleep 10
	echo "MCU Version:"`$mcuDir/mcudump ver|awk '{print $3}'`
else	
	echo 'MCU process NO exist!'
	untar;
	sleep 10
	echo "MCU Version:"`$mcuDir/mcudump ver|awk '{print $3}'`
	
fi
