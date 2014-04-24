#!/bin/bash

BASEDIR=$(dirname $0)
source $BASEDIR/config.sh 

if [[ "$1" = "-h" ]]; then
    echo ""
    echo -e "--     当前VJ版本: $VJ_VERSION\n"
    echo -e "-f     Force   强行更新.vimrc脚本为最新版"
    echo -e "-h     Help    显示此帮助信息并退出"
    echo ""
    exit 0
fi

echo -e "---- 备份VJ ----\n"
bash $BASEDIR/backup.sh 

echo -e "---- 更新.vimrc ----\n"
if [[ "$1" = "-f" ]]; then
    bash $BASEDIR/catvimrc.sh -f
else
    bash $BASEDIR/catvimrc.sh
fi

echo -e "---- 更新.vim ----\n"
bash $BASEDIR/catvimdir.sh 

echo -e "---- 更新.bash_profile ----\n"
sed -i '/_vj_bashrc/d' ~/.bash_profile
echo -e "source $VIMIDE_SRC/_vj_bashrc" >> ~/.bash_profile

read -p "VJ已经更新完成，请问需要立即生效吗？（否则将在下次登录时生效）[ctrl+c]取消(y/n) y:" isSource
case $isSource in
    y | Y | yes | YES | "")  source ~/.bash_profile
esac

