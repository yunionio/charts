#!/bin/bash

for dir in forvm/* ; do
    if [ ! -d "$dir" ]; then
        continue
    fi
    echo package "$dir"
    helm package "$dir" --destination ./_output
done

CUR_BRANCH=$(git branch --show-current)

git checkout gh-pages && ./deploy-pages.sh

git checkout $CUR_BRANCH
