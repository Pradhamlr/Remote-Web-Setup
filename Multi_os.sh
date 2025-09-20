#!/bin/bash

#PACKAGE="httpd unzip wget"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2142_cloud_sync.zip"
TEMP_DIR="/tmp/webfiles"
ART_NAME="2142_cloud_sync"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
       	PACKAGE="httpd unzip wget"
	SVC="httpd"	
	sudo yum install $PACKAGE -y > /dev/null
	sudo systemctl start $SVC
	mkdir -p $TEMP_DIR
	cd $TEMP_DIR
	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	cp -r $TEMP_DIR/$ART_NAME/* /var/www/html
	sudo systemctl restart $SVC
	sudo systemctl status $SVC
else
	PACKAGE="apache2 unzip wget"
	SVC="apache2"
	sudo apt update -y
	sudo apt install $PACKAGE -y > /dev/null
        sudo systemctl start $SVC
        mkdir -p $TEMP_DIR
        cd $TEMP_DIR
        wget $URL > /dev/null
        unzip $ART_NAME.zip > /dev/null
        cp -r $TEMP_DIR/$ART_NAME/* /var/www/html
        sudo systemctl restart $SVC
        sudo systemctl status $SVC
fi
