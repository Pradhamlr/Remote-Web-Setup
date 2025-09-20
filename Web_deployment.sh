#!/bin/bash

USR="devops"

for host in `cat hosts`
do
	echo "Connecting To $host"
	scp multi_os.sh $USR@$host:/tmp/
	ssh $USR@$host sudo /tmp/multi_os.sh 
done
