#!/bin/bash

cd /var/www/simple-app
echo "PWD.........................."
echo `pwd`
echo "YAY.........................."
/usr/local/bin/bundle --deployment
/usr/local/bin/bundle exec puma -t 0:16 -e staging -d
