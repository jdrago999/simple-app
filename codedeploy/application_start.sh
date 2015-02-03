#!/bin/bash

cd /var/www/simple-app/chef
librarian-chef install
cd /var/www/simple-app
/usr/bin/env chef-solo -c chef/solo.rb -j chef/node.json

