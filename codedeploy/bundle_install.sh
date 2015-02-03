#!/bin/bash

cd /var/www/simple-app
echo "PWD.........................."
echo `set`
echo "YAY.........................."
bundle --deployment
bundle exec puma -t 0:16 -e staging -d
