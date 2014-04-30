#!/bin/bash 

source $(dirname $0)/config.sh
# OLD_VIMRC=/home/q/tools/game_team/vim/runtime/_vimrc

temp_vimrc="/tmp/temp_vimrc"

if [[ ~/.vimrc -ef $OLD_VIMRC || "$1" = '-f' ]]; then
    touch new_vimrc > $temp_vimrc
    rm -rf new_vimrc
    rm -rf ~/.vimrc
elif [[ -h ~/.vimrc ]]; then
    LVIMRC=`readlink ~/.vimrc`
    rm -rf ~/.vimrc 
    echo -e "if filereadable(expand('$LVIMRC'))\n    exec 'source $LVIMRC'\nendif" > $temp_vimrc 
elif [[ -f ~/.vimrc ]]; then
    SED_RESULT=`sed -n '/GAME_TEAM_VJ/p' ~/.vimrc`
    if [[ -z "$SED_RESULT" ]]; then
        cat ~/.vimrc > $temp_vimrc
    else
        sed -n '/GAME_TEAM_VJ/ {s///; :a; n; p; ba; }' ~/.vimrc > $temp_vimrc 
    fi
else
    touch new_vimrc > $temp_vimrc 
    rm -f new_vimrc 
fi

echo -e '"  ---------------------------------------------' > ~/.vimrc 
echo -e "source $VIMIDE_SRC/.vimrc" >> ~/.vimrc 
cat $(dirname $0)/_vimrc_head $temp_vimrc >> ~/.vimrc
echo -e "~/.vimrc已生成\n"
rm -rf $temp_vimrc
