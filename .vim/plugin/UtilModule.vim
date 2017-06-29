"utilmod have some useful operation
"ӳ���{{{1
"�滻�ַ�����Ϊ��Ӧ��ֵ
nnoremap <leader>s :call UtilModule#SubstitudeFlag()<cr>

"�򿪴��ļ�����buffer
nnoremap <leader>nb :call UtilModule#OpenNewBufferForCurrentFile()<cr>

"���ò����ʼ�δ��������(motion)
onoremap in@ :<c-u>execute "normal! /\\w\\+\\([-+.]\\w\\+\\)*@\\w\\+\\([-.]\\w\\+\\)*\\.\\w\\+\\([-.]\\w\\+\\)*\r:nohlsearch\rvg_"<cr><cr>

"������β�ո�
nnoremap <leader>w :<c-u>execute ":match Error " . '/\v +$/'<cr>

"��������ո�
nnoremap <leader>W :<c-u>execute ":match none"<cr>

nnoremap <F3> :call asyncrun#quickfix_toggle(8)<cr>

"ӳ��cnext
nnoremap <leader>> :cnext<cr>

"ӳ��cprevious
nnoremap <leader>< :cprevious<cr>

"ӳ��grep����
nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

"ӳ��dash only for macos
if has('mac')
    nnoremap <leader>d :Dash<cr>
endif
"}}}
"�Զ�������{{{1
command! -nargs=0 InstallLvimrc :call UtilModule#InstallVim()<cr>
command! -nargs=0 UpdateLvimrc :call UtilModule#UpdateLvimrc()<cr>
command! -nargs=0 UninstallLvimrc :call UtilModule#UninstallLvimrc()<cr>
"}}}
"��������{{{1
"�滻��־Ϊ��Ӧʵ��{{{2
function! UtilModule#SubstitudeFlag()

	" ȫ������
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
	"�����ʼ�:%email%"
	let emailstr = "549676201@qq.com"
	silent! execute '%s/%email%/' . emailstr . '/g'

	" �ػ�����
	
	"��ǰ�ļ�trace(cpp)
	let g:um_cpptrace = 'NC_DO_MODULE_TRACE(_T("%s () ------ begin"), __AB_FUNC_NAME__);'
	silent! execute '%s/%cpp_trace%/' . g:um_cpptrace . '/g'

	"����^M�ַ�
	silent! execute '%s/\r//g'
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
    " ���²��
    PluginUpdate
    " ������
    PluginClean
endfunction
"}}}
"ж�ز������{{{2
function! UtilModule#UninstallLvimrc()
    if has('unix')
        silent execute '!rm -rf ' . expand($HOME) .'/vimfiles'
        silent execute '!rm -rf ' . expand($HOME) .'/.vim'
        silent execute '!rm -rf ' . expand($HOME) .'/vimfiles'
        silent execute '!rm -rf ' . expand($HOME) .'/.vimrc'
        silent execute '!rm -rf ' . expand($HOME) .'/README.MD'
        silent execute '!rm -rf ' . expand($HOME) .'/.git'
        silent execute '!rm -rf ' . expand($HOME) .'/.gitignore'
    else
    endif
endfunction
"}}}
"}}}
