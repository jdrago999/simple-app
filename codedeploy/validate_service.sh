#!/bin/bash

result=`curl -s http://localhost:9292/`

if [[ "$result" =~ "hello" ]]; then
    exit 0
else
    exit 1
fi
