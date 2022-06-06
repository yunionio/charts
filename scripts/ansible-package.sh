#!/bin/bash

CACHE_DIR="$(pwd)/_cache"

mkdir -p "$CACHE_DIR"

curl -L https://github.com/yunionio/ansible-telegraf/archive/1.0.0.tar.gz -o "$CACHE_DIR"/ansible-telegraf-1.0.0.tar.gz

curl -L https://github.com/geerlingguy/ansible-role-nginx/archive/3.1.1.tar.gz -o "$CACHE_DIR"/ansible-role-nginx-3.1.1.tar.gz
