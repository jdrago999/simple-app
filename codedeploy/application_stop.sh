#!/bin/bash

# Kill puma:
kill -s 9 `ps -ef | grep puma | head -n 1 | awk '{print $2}'`
