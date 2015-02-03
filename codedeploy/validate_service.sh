#!/bin/bash

exit

result=$(curl -s http://localhost:4567/)

if [[ "$result" =~ "Hello World" ]]; then
    exit 0
else
    exit 1
fi
