#!/bin/bash

cd /var/www/simple-app
bundle --deployment
bundle exec puma -t 0:16 -e staging -d
