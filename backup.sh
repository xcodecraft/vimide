#!/bin/bash

source $(dirname $0)/config.sh

function backupVim(){
dayTime=`date +%Y%m%d_%s`
backupDir=$HOME/backup/vim_config_bk/$dayTime
if [[ ! -d $backupDir ]]; then
    mkdir -p $backupDir
fi
cp -P ~/.vimrc $backupDir
cp -R ~/.vim   $backupDir
cp -P ~/.bash* $backupDir 
}

backupVim
echo -e "已将文件备份至" $backupDir 
echo "------------------------------"
