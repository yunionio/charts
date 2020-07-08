#!/bin/sh

# For All: ./push.sh forvm 
# Others: ./push.sh forvm/jenkins

HELM_REPO=${HELM_REPO:="https://charts.yunion.cn"}
HELM_REPO_USERNAME=${HELM_REPO_USERNAME:="admin"}
HELM_REPO_PASSWORD=${HELM_REPO_PASSWORD:="admin"}

if [ "$1" = "forvm" ];then
    for dir in "$1"/*
    do
        if test -d $dir; then
            echo command: helm push $dir $HELM_REPO -u $HELM_REPO_USERNAME -p $HELM_REPO_PASSWORD -f
            helm push $dir $HELM_REPO -u $HELM_REPO_USERNAME -p $HELM_REPO_PASSWORD -f
        fi
    done
else
    echo command: helm push "$1" $HELM_REPO -u $HELM_REPO_USERNAME -p $HELM_REPO_PASSWORD -f
    helm push "$1" $HELM_REPO -u $HELM_REPO_USERNAME -p $HELM_REPO_PASSWORD -f
fi
