#!/bin/bash

source $(dirname $0)/config.sh
BASEDIR=$(cd $(dirname $BASH_SOURCE);pwd)

if [[ -h ~/.vim ]]; then
    rm -rf ~/.vim
fi

if [[ ! -d ~/.vim ]]; then
    mkdir -p ~/.vim/
fi

if [[ ! -rd "$TEAM_BUNDLE_DIR" ]]; then
    echo -e "---- 正在创建 $TEAM_BUNDLE_DIR , 请输入sudo 权限密码： ----\n"
    sudo mkdir -p $TEAM_BUNDLE_DIR
    sudo chmod 777 $TEAM_BUNDLE_DIR
fi

if [[ ! ~/.vim/team_bundle -ef "$TEAM_BUNDLE_DIR" ]]; then
    echo -e "---- 更新 ~/.vim/team_bundle ----\n"
    rm -rf ~/.vim/team_bundle
    ln -s $TEAM_BUNDLE_DIR ~/.vim/team_bundle
fi

if [[ ! -rd  ~/.vim/team_bundle/Vundle.vim/ ]]; then
    echo -e "---- 更新 ~/.vim/team_bundle/Vundle.vim ----\n"
    git clone https://github.com/leiming/Vundle.vim.git ~/.vim/team_bundle/Vundle.vim/
fi


if [[ ! -rd  ~/.vim/team_bundle/pylon_ide/ ]]; then
    echo -e "---- 更新 ~/.vim/team_bundle/pylon_ide ----\n"
    git clone https://bitbucket.org/gameteam360/pylon_ide.git ~/.vim/team_bundle/pylon_ide/
fi


# todo: 更新editorconfig
rm -rf ~/.vim/.editorconfig
if [[ ! -r ~/.vim/.editorconfig ]]; then
    echo -e "---- 生成 ~/.vim/.editorconfig 文件 ----\n"
    cp -f $BASEDIR/.editorconfig  ~/.vim/
fi
