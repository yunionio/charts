#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# copy all generated helm packages to current
cp -a ./_output/* .

# regenerate with old versions packages
cp -a *.tgz ./_output
(cd ./_output && helm repo index .)
cp -a ./_output/* .

# add changes to git
git add .

# commit changes
msg="rebuilding helm site `date`"
if [ $# -eq 1 ]; then
    msg="$1"
fi

git commit -m "$msg"

git push origin gh-pages
