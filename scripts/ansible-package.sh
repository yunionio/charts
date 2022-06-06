#!/bin/bash

CACHE_DIR="$(pwd)/_cache"

mkdir -p "$CACHE_DIR"

#curl -L https://github.com/yunionio/ansible-telegraf/archive/refs/heads/master.zip -o "$CACHE_DIR"/ansible-telegraf.zip

curl -L https://github.com/geerlingguy/ansible-role-nginx/archive/3.1.1.tar.gz -o "$CACHE_DIR"/ansible-role-nginx-3.1.1.tar.gz
