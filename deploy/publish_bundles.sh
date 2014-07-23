#!/bin/bash

BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)
source $BASEDIR/../config.sh
while read <&10 remote_ip; do
    ssh $remote_ip "[[ ! -rd $TEAM_BUNDLE_DIR ]] && sudo mkdir $TEAM_BUNDLE_DIR; sudo chmod 777 $TEAM_BUNDLE_DIR;"
    rsync -avzh --chmod=ugo=rwx $TEAM_BUNDLE_DIR/* $remote_ip:$TEAM_BUNDLE_DIR
    echo -e "---- 同步 $remote_ip:$TEAM_BUNDLE_DIR 完成----\n"
done 10< iplist

