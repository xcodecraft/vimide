#!/bin/bash

BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)
source $BASEDIR/../config.sh
if [[ -z "$1" ]]; then
   SOURCE_DIR=$CURRENT_VIMIDE
elif [[ ! -rd "$1" ]]; then
    echo "路径无效或不可读"
    return 0
else
    SOURCE_DIR=$1
fi

while read <&10 remote_ip; do
    ssh $remote_ip "[[ ! -d $SOURCE_DIR ]] && sudo mkdir $SOURCE_DIR; sudo chmod 777 $SOURCE_DIR; || ([[ ! -r $SOURCE_DIR ]] && sudo chmod 777 $SOURCE_DIR;)"
    rsync -avzh --chmod=ugo=rwx $SOURCE_DIR/* $remote_ip:$SOURCE_DIR
    echo -e "---- 同步 $remote_ip:$SOURCE_DIR 完成----\n"
done 10< testiplist

