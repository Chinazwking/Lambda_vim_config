"wangzhuowei's vimrc files{{{1
"
"author:
"    wangzhuowe@eisoo.com
"
"time:
"    2016-8-2
"}}}
"��������{{{1
"�رռ���ģʽ
set nocompatible

"�Զ��﷨����
syntax on


"��ʾ�к�
set number

"ͻ����ʾ��ǰ��
set cursorline
	
"��״̬�����
set ruler

"�ÿո��滻tab
set expandtab

"�趨tab����
set tabstop=4
set softtabstop=4

"�����ļ�������
set nobackup

"������undo�ļ�
set noundofile

"������swap�ļ�
set noswapfile

"����ÿ������ı�����
set textwidth=80

"�����ļ���ʽ
set fileformat=unix

"�Զ��л�Ŀ¼Ϊ��ǰ�ļ�Ŀ¼
set autochdir

"�����Զ�����
set autoindent

"���ñ�����ΪΪ����
set backupcopy=yes

"��̬��ʾ��������
set incsearch

"�����������ı�
set hlsearch

"�رմ�����Ϣ����
set noerrorbells

"���������Ƕ��ݵ�����ƥ������
set showmatch

"����ȥ��ʱ��
set matchtime=5

"����ħ��
set magic

"������������
set smartindent

"�ǲ���״̬���޷����޷�ɾ���س���
set backspace=indent,eol,start

"��ʼ�۵�
set foldenable

"�����﷨�۵�
set foldmethod=manual

"�����۵����
set foldcolumn=0

"�����۵�����
setlocal foldlevel=1 

"����Ϊ�Զ��ر��۵�
set foldclose=all

"ʹ��״̬���������зֿ�    
set laststatus=2

"ȥ���˵�
set go=

"����c�������
set cindent

"���������Сд
set ignorecase

"����ÿһ����������
set shiftwidth=4

"����״̬��
set statusline=%<%f%h%m%r%y%=%b\ 0x%B\ \ %l/%L,%c\ %P

"����ճ������Ϊunnamed�Ĵ���
set clipboard=unnamed

"GVIMȫ����
if has('gui_running') && has("win32")
    au GUIEnter * simalt ~x
endif

"���ñ����ʽ
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

"��������
if has('mac')
    set guifont=Monaco:h18
elseif has('win32')
    set guifont=consolas:h14
endif

"�����������¹��
set scrolloff=3

"�����������ڴ�С
"set lines=30 columns=80
"}}}
"ӳ���{{{1
"����learder��
let mapleader = ","

"����localleader
let maplocalleader = "\\"

"���ô������ļ���ݼ�
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"�ַ�����ʱ�Զ�����\v����
nnoremap / /\v
nnoremap ? ?\v

nnoremap <leader>/ :execute "normal! /\\v" . expand(@*). "\r"<cr>

"ȥ����������
nnoremap <leader>nh :nohlsearch<cr>

"ʹvimrc������Ϊ�ű�����ִ��
nnoremap <leader>sv :source $MYVIMRC<cr>

"�����ʼ��ϵ�����
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lbl<cr>

"�ٲ���ģʽ����jkȡ��<esc>
inoremap jk <esc>

"�ٲ���ģʽ�н�ֹʹ��<esc>��
inoremap <esc> <nop>

"���÷����
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
noremap <left> <nop>

"�����л������Ŀ�ݼ�
nnoremap <leader><leader> <c-w>
"}}}
"�Զ�����{{{1
"�����Զ������飬��ֹ�ظ�����
augroup wzws_autocmd

"��������Զ�����
	autocmd!

"����c++����
	autocmd FileType cpp source $HOME/.vim/plugin/CppPlugin.vim

"����python����
    autocmd Filetype python source $HOME/.vim/plugin/PythonPlugin.vim

"����scheme����
	autocmd FileType scheme source $HOME/.vim/plugin/SchemePlugin.vim

"��vim�ļ�ʱ����marker����
    autocmd FileType vim source $HOME/.vim/plugin/VimPlugin.vim

"����AsyncRun
	source $HOME/.vim/plugin/asyncrun.vim

"����ͨ��ģ��
    source $HOME/.vim/plugin/UtilModule.vim

"���������ļ�
    source $HOME/.vim/plugin/PluginConfig.vim

"�����
augroup END
"}}}
"�Զ�������{{{1
"���ز���ģʽ��ֵ��
command! LoadCalcMod source $HOME/.vim/plugin/CalcModule.vim
"}}}
"Vundle����б�{{{1
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin('$HOME/vimfiles/bundle')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" NERD-Tree allow you explore your filesystem and to open or edit them
Plugin 'The-NERD-tree'
" Provide an easy way to browse the tags of the current file
Plugin 'majutsushi/tagbar'
" A statusline mamanger
Plugin 'bling/vim-airline'
" A syntax check tools
" Plugin 'vim-syntastic/syntastic'
" Color scheme
Plugin 'molokai'

if has('mac')
" Dash plugin for mac
Plugin 'rizzatti/dash.vim'
endif

call vundle#end()            " required
filetype plugin indent on    " required
"}}}
