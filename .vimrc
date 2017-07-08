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

"���ñ����ʽ
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

"�����������¹��
set scrolloff=3

"gvimר��
if has('gui_running')
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

    "�Զ��л�Ŀ¼Ϊ��ǰ�ļ�Ŀ¼
    set autochdir

    "����ƽ̨�����Ϣ
    if has('mac')
        set guifont=Monaco:h18
        set rtp+=~/.vim

    elseif has('win32')
        set guifont=consolas:h14
        set rtp+=~\.vim
        "win GVIMȫ����
        au GUIEnter * simalt ~x

    else
        set rtp+=~/.vim

    endif
endif

"}}}
"ӳ���{{{1
"�ַ�����ʱ�Զ�����\v����
nnoremap / /\v
nnoremap ? ?\v

"�ٲ���ģʽ����jkȡ��<esc>
inoremap jk <esc>

"�ٲ���ģʽ�н�ֹʹ��<esc>��
inoremap <esc> <nop>

"���÷����
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>
noremap <left> <nop>

"buffer�л�����
nnoremap <PageUp> :bp<cr>
nnoremap <PageDown> :bn<cr>

"���ò����ʼ�δ��������(motion)
onoremap in@ :<c-u>execute "normal! /\\w\\+\\([-+.]\\w\\+\\)*@\\w\\+\\([-.]\\w\\+\\)*\\.\\w\\+\\([-.]\\w\\+\\)*\r:nohlsearch\rvg_"<cr><cr>

"����learder��
let mapleader = ','

"����localleader
let maplocalleader = '\'

"���ô������ļ���ݼ�
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"ʹvimrc������Ϊ�ű�����ִ��
nnoremap <leader>sv :source $MYVIMRC<cr>

"����@"�Ĵ���������
nnoremap <leader>/ :execute "normal! /\\v" . expand(@*). "\r"<cr>

"ȥ����������
nnoremap <leader>nh :nohlsearch<cr>

"�����ʼ��ϵ�����
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lbl<cr>

"�����л������Ŀ�ݼ�
nnoremap <leader><leader> <c-w>

"ӳ��cnext
nnoremap <leader>> :cnext<cr>

"ӳ��cprevious
nnoremap <leader>< :cprevious<cr>
"}}}
"ȫ�ּ���{{{1
"����ͨ��ģ��
    source $HOME/.vim/plugins/UtilModule.vim

"���������ļ�
    source $HOME/.vim/plugins/PluginConfig.vim
"}}}
"�Զ�����{{{1
"�����Զ������飬��ֹ�ظ�����
augroup wzws_autocmd

"��������Զ�����
    autocmd!

"����c++����
    autocmd FileType cpp source $HOME/.vim/plugins/CppPlugin.vim

"����python����
    autocmd Filetype python source $HOME/.vim/plugins/PythonPlugin.vim

"����scheme����
    autocmd FileType scheme source $HOME/.vim/plugins/SchemePlugin.vim

"��vim�ļ�ʱ����marker����
    autocmd FileType vim source $HOME/.vim/plugins/VimPlugin.vim

"�����
augroup END
"}}}
