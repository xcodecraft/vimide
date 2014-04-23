#!/bin/bash 
source $(dirname $0)/config.sh

# BACKUP_DIR=$HOME/backup/vim_config_bk

read -p "恢复功能会覆盖VJ配置，请问需要恢复前备份当前配置吗？[ctrl+c]取消 (y/n) n: " isBackup
case $isBackup in
    y | Y | yes | YES ) bash ./backup.sh
esac

index=1

function format_dir(){
    name=$1
    echo ${name##*/}
}

echo 当前备份文件夹中共存在以下版本:
for f in $BACKUP_DIR/*
do
    echo [$index]"--"`ls -ld $f`
    dir_name=$f
    array[$index]=${dir_name##*/}
    let index++
done

read -p "请从如上列表中选择需要恢复的版本序列（数字）,[ctrl+c]取消：" selectedNum

if [[ ${array[$selectedNum]} == "" ]]; then
    echo "ERROR! 输入序列不合法，请重新执行"
    exit 1
fi
   
bk_vim=${array[$selectedNum]}

cur_bk_path=$BACKUP_DIR/$bk_vim

if [[ -d $cur_bk_path/.vim || -f $cur_bk_path/.vim ]]; then
   rm -rf ~/.vim
   cp -R $cur_bk_path/.vim ~
   echo "~/.vim/ 已恢复"
fi

if [[ -e $cur_bk_path/.vimrc ]]; then
    rm -rf ~/.vimrc
    cp -P $cur_bk_path/.vimrc ~
    echo "~/.vimrc 已恢复"
fi

if [[ -e $cur_bk_path/.bashrc ]]; then
    rm -rf ~/.bashrc
    cp -P $cur_bk_path/.bashrc ~
    echo "~/.bashrc 已恢复"
fi

if [[ -e $cur_bk_path/.bash_profile ]]; then
    rm -rf ~/.bash_profile
    cp -P $cur_bk_path/.bash_profile ~
    echo "~/.bash_profile 已恢复"
fi

read -p "VJ已经还原，请问需要立即生效吗? [ctrl+c]取消：(y/n) n:" isSource
case $isSource in
    y | Y | yes | YES ) source ~/.bash_profile
esac
