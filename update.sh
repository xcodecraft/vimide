#!/bin/bash

BASEDIR=$(dirname $0)
source $BASEDIR/config.sh 

echo -e "---- 备份VJ ----\n"
bash $BASEDIR/backup.sh 

echo -e "---- 更新.vimrc ----\n"
bash $BASEDIR/catvimrc.sh

echo -e "---- 更新.vim ----\n"
bash $BASEDIR/catvimdir.sh 

echo -e "---- 更新.bash_profile ----\n"
sed -i '/_vj_bashrc/d' ~/.bash_profile
echo -e "source $VIMIDE_SRC/_vj_bashrc" >> ~/.bash_profile

read -p "VJ已经更新完成，请问需要立即生效吗？（否则将在下次登录时生效）[ctrl+c]取消(y/n) n:" isSource
case $isSource in
    y | Y | yes | YES )  source ~/.bash_profile
esac

