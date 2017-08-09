"utilmod have some useful operation
"ӳ���{{{1
"�滻�ַ�����Ϊ��Ӧ��ֵ
nnoremap <leader>s :call UtilModule#SubstitudeFlag()<cr>

"�򿪴��ļ�����buffer
nnoremap <leader>nb :call UtilModule#OpenNewBufferForCurrentFile()<cr>

"����δʹ�õ�buffer
nnoremap <leader>bc :call UtilModule#CleanUnusedBuffer()<cr>

"ӳ��grep����
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

"}}}
"�Զ�������{{{1
"������Ϲ�������
command! -nargs=0 InstallLvimrc call UtilModule#InstallLvimrc()
command! -nargs=0 UpdateLvimrc call UtilModule#UpdateLvimrc()
command! -nargs=0 UninstallLvimrc call UtilModule#UninstallLvimrc()
"���ز���ģʽ��ֵ��
command! LoadCalcMod source $HOME/.vim/plugins/CalcModule.vim
"}}}
"ȫ�ֱ���{{{1
if has('win32')
    let g:newline = '\r\n'
    let g:asyncrun_encs = 'cp936'
elseif has('mac')
    let g:newline = '\r'
    let g:asyncrun_encs = 'utf-8'
else
    let g:newline = '\n'
    let g:asyncrun_encs = 'utf-8'
endif

"}}}
"��������{{{1
"�滻��־Ϊ��Ӧʵ��{{{2
function! UtilModule#SubstitudeFlag()

    "ȫ������
    "��ǰ�ļ���:%fname%
    let fnamestr = expand("%")
    silent! execute '%s/%fname%/' . fnamestr . '/g'
    "��ǰ�ļ���ͷ:%fname:h%
    let fnamehstr = expand("%:r")
    silent! execute '%s/%fname:h%/' . fnamehstr . '/g'
    "��ǰ����:%fline%
    let flinestr = string(line("."))
    silent! execute '%s/%fline%/' . flinestr . '/g'
    "��ǰʱ��:%ctime%
    let ctimestr = substitute(strftime("%Y-%b-%d"), "��", "", "")
    silent! execute '%s/%ctime%/' . ctimestr . '/g'
    "�����ʼ�:%email%
    let emailstr = "549676201@qq.com"
    silent! execute '%s/%email%/' . emailstr . '/g'

    "��ǰ�ļ�trace(cpp)
    let g:cpptrace = 'NC_DO_MODULE_TRACE(_T("%s () ------ begin"), __AB_FUNC_NAME__);'
                \ . g:newline . '\tNC_DO_MODULE_TRACE(_T("%s () ------ end"), __AB_FUNC_NAME__);'
    silent! execute '%s/%cpp_trace%/' . g:cpptrace . '/g'

    "����^M�ַ�
    silent! execute '%s/\r//g'

    "���ĩβ�ո��
    silent! execute '%s/\v\s+$//g'

    "tab�滻Ϊ�ո��
    retab!

    "cpp �ļ��Զ���Ϊbom��ʽ
    if &filetype ==# 'cpp'
        set bomb
    endif

    "�����޸�
    write
endfunction
"}}}
"���´���һ��GVIM���򿪴��ļ�{{{2
function! UtilModule#OpenNewBufferForCurrentFile()
    let fnamestr = expand("%")
    silent! execute '!start gvim ' . fnamestr
endfunction
"}}}
"ʹ��ϵͳgrep������ָ���ַ���{{{2
function! s:GrepOperator(type)
    let saved_unnamed_register = @"

    if has('win32')
        let l:slash = "\\"
    else
        let l:slash = "\/"
    endif

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    let findpath = getcwd()

    if (has("win32"))
        silent execute "grep! /S " . shellescape(@") . " " . findpath . l:slash . "*"
    else
        silent execute "grep! -R " . shellescape(@") . " " . findpath . l:slash . "*"
    endif

    copen

    let @" = saved_unnamed_register
endfunction
"}}}
"��װ�������{{{2
function! UtilModule#InstallLvimrc()
    "��װ���
    PluginInstall
endfunction
"}}}
"���²������{{{2
function! UtilModule#UpdateLvimrc()
    execute 'helptags ++t ../doc'
    " ���²��
    execute 'PluginUpdate'
    " ������
    execute 'PluginClean'
    q
endfunction
"}}}
"ж�ز������{{{2
function! UtilModule#UninstallLvimrc()
    if has('unix')
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/vimfiles'
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/.vim'
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/.vimrc'
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/README.MD'
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/.git'
        silent execute 'AsyncRun rm -rf ' . expand($HOME) .'/.gitignore'
    else
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\vimfiles'
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\.vim'
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\.vimrc'
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\README.MD'
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\.git'
        silent execute 'AsyncRun del /Q ' . expand($HOME) .'\.gitignore'
    endif
endfunction
"}}}
"����bufferlist{{{2
function! UtilModule#CleanUnusedBuffer()
    let current_number = bufnr('%')
    let last_number = bufnr('$')
    let nerd_number = bufnr('NERD*')
    let i = 1

    while i <= last_number
        if (i != current_number) && (i != nerd_number)
            silent! execute 'bw ' . string(i)
        endif
        let i = i + 1
    endwhile
endfunction
"}}}
"}}}
