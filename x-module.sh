#!/bin/bash
#for stop-status check

test(){
    if [ "$pid" = '' ];then
        echo "$1 service is NOT running!"
    elif [ $? = 0 ];then
        echo "$1 is stopped OK!!!"
    else
        echo "$1 stopped Faillure!!!" && exit 1
    fi
}

instCheck(){
    if [ $? = 0 ];then
        echo 'Installation OK!!!'
    else
#        exit 1;echo "Exit installation,Got ERROR!!!"
	echo -e "\033[33mError: Cancel installation,Disk full!\033[0m";exit 1
    fi
}

case $1 in 
	opensips)
        /opt/script/xserver stop
        test $1;
		sh ./install.sh <<EOF >$1_install
1 
EOF
        instCheck;
		/opt/script/xserver start
	;;
	asterisk)
        /opt/script/xserver_for_asterisk stop
        test $1;
		sh ./install.sh <<EOF >$1_install
2 
EOF
        instCheck;
		/opt/script/xserver_for_asterisk start
	;;

	kamailio)
        pro_kamailio stop
        test $1;
		sh ./install.sh <<EOF >$1_install
4
EOF
        instCheck;
		pro_kamailio start
	;;
	rtpproxy)
        pro_rtpproxy stop
        test $1;
		sh ./install.sh <<EOF >$1_install
5
EOF
        instCheck;
		pro_rtpproxy start
	;;
	*)
		echo "USAGE:(kamailio|rtpproxy|opensips|asterisk)"
esac
