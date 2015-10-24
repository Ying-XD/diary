"=====================================
"	FileName: 	.vimrc
"	Author:		Ying_xd
"	Email:		Ying_xd@zju.edu.cn
"	Date:		2015/6/17
"=====================================

"=====================================
"	Vim 基本配置
"=====================================

"关闭vi的一致性
set nocompatible
"配置backsapce键工作方式
set backspace=indent,eol,start

"高亮
syntax on

"显示行号
set number
"显示光标信息
set ruler
"匹配模式
set showmatch
"突出显示当前行
set cursorline

"C/C++方式对齐
set autoindent
set cindent


set nowrap
"取消备份
set nobackup
set noswapfile

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

"设置编码方式
set encoding=utf-8
"制定配色为256色
set t_Co=256
"设定在Vim中可使用鼠标
"set ouse=a
"设置高亮主题
colorscheme molokai

"检测文件类型
filetype on
"不同文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"只能补全
filetype plugin indent on


"==============================
" Vundle 配置
"==============================
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

"使用Vundle管理
Bundle 'gmarik/vundle'
"PowerLine 插件 {
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'
" }
"AirLine 插件 {
"Bundle 'bling/vim-airline'
"}
" taglis 插件 {
Bundle 'taglist.vim'
" }
" NERDTree 插件
Bundle 'scrooloose/nerdtree'

Bundle 'snipMate'
" 终端插件
Bundle 'oplatek/Conque-Shell'
call vundle#end()
"==============================
nnoremap b[ :bp<CR>
nnoremap b] :bn<CR>
"==============================

filetype plugin indent on
"==============================
" Taglist 配置
"==============================
nmap <F3> :Tlist<CR>
imap <F3> <Esc>: Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Ctags_Cmd="/usr/bin/ctags"

" ===================================
" 按键替换
" ===================================
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap ctb <esc>:ConqueTermSplit bash<cr><esc>:resize 10<cr>i
nmap ctp <esc>:ConqueTermSplit python<cr><esc>:resize 10<cr>i
" ====================================
" NerdTree配置
" ====================================
nmap <F2> :NERDTreeToggle<CR>
imap <F2> <ESC>: NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"let NERDTreeChDirMode=2  "选中root即设置为当前目录
""let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
filetype plugin on

"========== ConqueTerm 配置=============================
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_InsertOnEnter = 1
function ConqueTermMode()
setlocal tw=0
setlocal nolist
setlocal nospell
" Work-around the bug with Tlist
inoremap <buffer> <c-w>h <esc><c-w>h
inoremap <buffer> <c-w>j <esc><c-w>j
inoremap <buffer> <c-w>k <esc><c-w>k
inoremap <buffer> <c-w>l <esc><c-w>l
inoremap <buffer> <esc><c-w>h <esc><c-w>h
inoremap <buffer> <esc><c-w>j <esc><c-w>j
inoremap <buffer> <esc><c-w>k <esc><c-w>k
inoremap <buffer> <esc><c-w>l <esc><c-w>l
endfunction
command -nargs=0 ConqueTermMode call ConqueTermMode()
au! FileType conque_term ConqueTermMode


