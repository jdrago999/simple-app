#!/bin/bash

cd /var/www/simple-app

# Override the value set by AWS CodeDeploy before we try to bundle:
BUNDLE_GEMFILE=/var/www/simple-app/Gemfile

# Only start puma if bundle installation succeeds:
bundle --deployment && bundle exec puma -t 0:16 -e staging -d
