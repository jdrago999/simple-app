#!/bin/bash

# Kill puma:
if [[ `ps -ef | grep puma | grep -v grep` ]]; then
  kill -s 9 `ps -ef | grep puma | grep -v grep | head -n 1 | awk '{print $2}'` || echo 'puma not running -- continuing onward'
fi
