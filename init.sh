#!/bin/bash

name=$1

mkdir heroku_init
cd heroku_init

for i in {1..5}
do
	git clone https://github.com/heroku/php-getting-started.git
	cd php-getting-started
	heroku create ${name}${i}
	git push heroku master
	cd ..
	rm -rf php-getting-started
done

cd ..
rm -rf heroku_init