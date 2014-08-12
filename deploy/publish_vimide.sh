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
    ssh -t $remote_ip "if [ ! -d $SOURCE_DIR ]; then sudo mkdir -p $SOURCE_DIR; fi; sudo chmod 777 -R $SOURCE_DIR;sudo rsync -avz --delete --force $USER@$TARGET_IP:$SOURCE_DIR/ $SOURCE_DIR/ ;"
    # sudo rsync -avz --delete --progress --force $SOURCE_DIR/ leiming@$remote_ip:$SOURCE_DIR/
    echo -e "---- 同步 $remote_ip:$SOURCE_DIR 完成----\n"
done 10< testiplist

