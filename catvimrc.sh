#!/bin/bash 

# 生成新的.vimrc文件 
# 1. 旧链接文件-> 拼接文件为空文件 
# 2. 普通链接文件 -> if readable .. source link endif
# 3. 普通文件，则查询：
#   SED_RESULT=`sed -n '/GAME_TEAM_VJ/p' ~/.vimrc `
#   if result 为空， 则没更新过，拼接文件为源文件 
#     cp ~/.vimrc 拼接文件 
#   else 更新过
#     sed -n '/^" GAME_TEAM_VJ/ {s///; :a; n; p; ba; }' _vimrc_local > 拼接文件 

source $(dirname $0)/config.sh
# OLD_VIMRC=/home/q/tools/game_team/vim/runtime/_vimrc

temp_vimrc="/tmp/temp_vimrc"

if [[ ~/.vimrc -ef $OLD_VIMRC ]]; then
    touch new_vimrc > $temp_vimrc
    rm -f new_vimrc
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
