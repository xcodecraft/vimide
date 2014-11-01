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

set backspace=indent,eol,start
set smartindent
set ruler
set number
set showcmd
set tabstop=4
set expandtab
set shiftwidth=4
set foldcolumn=2

" Show the next match while entering a search
set incsearch
set showmatch
set foldmethod=marker

set history=10000
set nrformats=

set wildmenu
set wildmode=full
" set wildmode=longest,list

if has("vms")
  set nobackup
else
  set backup
endif

" 用 editorconfig 统一托管缩进格式，所以不需要对 Vim 单独配置
" autocmd FileType html,css,javascript setlocal shiftwidth=2 | set foldmethod=indent
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,*_ngx.conf set filetype=nginx | syntax on

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
autocmd FileType vim set omnifunc=syntaxcomplete#Complete

" html 默认折叠为2级
autocmd BufRead,BufNewFile FileType html setlocal foldlevel=2

" 去除 PHP 尖括号「<:>」的默认匹配与自动补全
autocmd FileType php set matchpairs-=<:>

" 使 php 和 js 的单词带 $ 符号，从而修复 Debug 问题
autocmd FileType php,javascript setlocal iskeyword+=$
autocmd FileType php setlocal iskeyword-=-

" 保存前自动压缩末尾空格
autocmd BufWritePre *.pl :%s/\s\+$//e

" 文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
scriptencoding utf-8

" set background=dark
set errorformat=%m\ in\ %f\ on\ line\ %l

" 配色Vim为256
set t_Co=256
set bg=dark
colorscheme default
