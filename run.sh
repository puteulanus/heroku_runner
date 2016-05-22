#!/bin/bash

PATH="/usr/local/heroku/bin:$PATH"

# load mail and password
mail=$HEROKU_EMAIL
passwd=$(echo ${mail} | awk -F[@] '{print $1}')
cmd=$CMD_URL

if [ -z $mail ] && [ -z $passwd ] && [ -z $cmd ]
then
	echo $mail
	echo $passwd
	echo $cmd
	echo 'exit'
	exit
fi

# login
(sleep 5; echo $mail; sleep 1; echo $passwd) | /usr/local/heroku/bin/heroku login

# loop to create screen
for i in {1..5}
do
	echo '#!/bin/bash' > /tmp/screen${i}.sh
	echo "while true; do (sleep 5; echo 'while true; do wget -O- ${cmd} | bash; done') | /usr/local/heroku/bin/heroku run bash --app ${passwd}${i}; done" >> /tmp/screen${i}.sh
	chmod +x /tmp/screen${i}.sh
	screen -dm -S h$i "/tmp/screen${i}.sh"
done

# stop here
while true
do
	sleep 3600
done