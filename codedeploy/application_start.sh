#!/bin/bash

# Fetch and install the cookbooks we depend on:
cd /var/www/simple-app/chef
librarian-chef install

# Apply the chef recipes to this machine:
cd /var/www/simple-app
/usr/bin/env chef-solo -c chef/solo.rb -j chef/node.json

# This is a deploy-only bundle, so make sure we can write to the necessary folders:
if [ ! -d log ]; then
  mkdir log
  mkdir -p tmp/pid
fi

chown ubuntu:ubuntu -R /var/www/simple-app
su ubuntu -c 'cd /var/www/simple-app && bundle install --without test && bundle exec puma -t 0:16 -e staging -d'
