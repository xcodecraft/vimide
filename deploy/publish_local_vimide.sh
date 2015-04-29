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



if [ ! -d $SOURCE_DIR ]; then
    sudo mkdir -p $SOURCE_DIR
fi

sudo chmod 777 -R $SOURCE_DIR

sudo rsync -avz --delete --force  $HOME/devspace/vimide/ $SOURCE_DIR/ ;

echo -e "---- 同步 $HOME/devspace/vimide/ 完成----\n"

