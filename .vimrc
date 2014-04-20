set nocompatible
syntax enable
" --- configure Vundle ---
filetype on
filetype off

set rtp+=~/.vim/team_bundle/Vundle.vim/

call vundle#rc()

" 团队vimrc文件根目录
let VIMIDE_DIR=expand("<sfile>:p:h")

if filereadable(expand(VIMIDE_DIR.'/.vimrc.bundles'))
    exec 'source '.VIMIDE_DIR.'/.vimrc.bundles'
endif

if filereadable(expand(VIMIDE_DIR."/.vimrc.local"))
    exec 'source '.VIMIDE_DIR.'/.vimrc.local'
endif

filetype plugin indent on

" --- END configure Vundle ---

set bs=indent,eol,start

set smartindent
if has("vms")
  set nobackup
else
  set backup
endif
set ruler
set showcmd
filetype plugin indent on
set tabstop=4
set expandtab
set shiftwidth=4
set foldcolumn=2
set incsearch
set showmatch
set foldmethod=marker

autocmd FileType html,css,javascript setlocal shiftwidth=2
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,*_ngx.conf if &ft == '' | setfiletype nginx | endif 

let editorconfig=expand('~/.vim/team_bundle/.editorconfig')
if filereadable(editorconfig)
    let g:editorconfig_Beautifier=editorconfig
endif

" 备份文件位置
if !filereadable(expand('~/backup/vim/'))
    silent execute ":!mkdir -p ~/backup/vim"
endif
set backupdir=~/backup/vim
set backupext=.bak

" 配色Vim为256
set t_Co=256
scriptencoding utf-8
colorscheme darkburn
set nu
set bg=dark 

" Visual Mode 快捷键
map vi' <Esc>?'<CR>lv/'<CR>h
map vi" <Esc>?"<CR>lv/"<CR>h
map va' <Esc>?'<CR>v/'<CR>
map va" <Esc>?"<CR>v/"<CR>
map vix <Esc>?><CR>lv/<<CR>h
map vi= <ESC>?\s\+\S\+\s*=\s*\S\+<CR>lv/=<CR>/\S<CR>/[\s<>\n]<CR>h
map vi/ <Esc>?\/<CR>l<Esc>v/\/<CR>h
map vt) <ESC>v/)<CR>h
map vt' <ESC>v/'<CR>h
map vt" <ESC>v/"<CR>h
map vt; <ESC>v/;<CR>h
map vt, <ESC>v/,<CR>h
map vt} <ESC>v/}<CR>h

" php和html文件的补全规则
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" 文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" set background=dark
set errorformat=%m\ in\ %f\ on\ line\ %l

