#!/bin/bash

cd /var/www/simple-app
echo "PWD.........................."
echo `set`
echo "YAY.........................."
BUNDLE_GEMFILE=/var/www/simple-app/Gemfile /usr/local/bin/bundle --deployment
BUNDLE_GEMFILE=/var/www/simple-app/Gemfile /usr/local/bin/bundle exec puma -t 0:16 -e staging -d
