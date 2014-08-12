#!/bin/bash

BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)
source $BASEDIR/../config.sh
if [[ -z "$1" ]]; then
   SOURCE_DIR=$CURRENT_VIMIDE
elif [[ ! -d "$1" ]]; then
    echo "路径无效或不可读"
    return 0
else
    SOURCE_DIR=$1
fi

if [[ -z "$2" ]]; then
    USER=$(whoami)
else
    USER=$2
fi

TARGET_IP="10.16.73.21"

while read <&10 remote_ip; do
    ssh -t $remote_ip "if [ ! -d $TEAM_BUNDLE_DIR ]; then sudo mkdir -p $TEAM_BUNDLE_DIR; fi; sudo chmod 777 -R $TEAM_BUNDLE_DIR; sudo rsync -avz --delete --force $USER@$TARGET_IP:$TEAM_BUNDLE_DIR/ $TEAM_BUNDLE_DIR/ ;"
    # ssh -t $remote_ip "test -d $TEAM_BUNDLE_DIR || sudo mkdir $TEAM_BUNDLE_DIR;"
    # ssh -t $remote_ip "test -r $TEAM_BUNDLE_DIR || sudo chmod 777 $TEAM_BUNDLE_DIR -R;"
    # rsync -avzh --delete --chmod=ugo=rwx $TEAM_BUNDLE_DIR/* $remote_ip:$TEAM_BUNDLE_DIR
    echo -e "---- 同步 $remote_ip:$TEAM_BUNDLE_DIR 完成----\n"
done 10< testiplist

