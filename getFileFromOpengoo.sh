#!/bin/bash

fileID=$1
login_url="http://192.168.1.2/fengoffice/index.php?c=access&a=login"
user=****
password=****

#-----get cookies and save to local file-----
wget --save-cookies cookies.txt --post-data "login%5Busername%5D=${user}&login%5Bpassword%5D=${password}&login%5Bremember%5D=checked" "$login_url" --quiet 

#------use the cookies file to download package from opengoo----
wget  --content-disposition --load-cookies cookies.txt "http://192.168.1.2/fengoffice/index.php?c=files&a=download_file&id=$fileID"
