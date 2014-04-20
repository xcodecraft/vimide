#!/bin/bash 
source $(dirname $0)/config.sh

# vim_ide文件夹位置
# export VIMIDE_SRC

if [[ -h ~/.vim ]]; then
    rm -rf ~/.vim
fi
if [[ ! -d ~/.vim ]]; then
    mkdir -p ~/.vim/
fi

if [[ ! ~/.vim/team_bundle -ef "$VIMIDE_SRC/team_bundle" ]]; then
    echo -e "---- 更新 ~/.vim/team_bundle ----\n"
    rm -rf ~/.vim/team_bundle
    ln -s $VIMIDE_SRC/team_bundle ~/.vim/team_bundle 
fi

