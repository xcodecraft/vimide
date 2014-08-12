#!/bin/bash

BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)

USER=leiming

source $BASEDIR/../config.sh
while read <&10 remote_ip; do
    ssh $remote_ip "echo $TEAM_BUNDLE_DIR; test -d $TEAM_BUNDLE_DIR && echo true ||  echo false"
    # ssh $remote_ip "test -d $TEAM_BUNDLE_DIR || sudo mkdir $TEAM_BUNDLE_DIR; sudo chmod 777 $TEAM_BUNDLE_DIR;"
    rsync -avzh --chmod=ugo=rwx $TEAM_BUNDLE_DIR/* $remote_ip:$TEAM_BUNDLE_DIR
    echo -e "---- 同步 $remote_ip:$TEAM_BUNDLE_DIR 完成----\n"
done 10< testiplist

