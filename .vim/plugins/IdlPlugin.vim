"while idl file open. loading following map and func
"ӳ���{{{1
"�Զ���ȫ���ַ���
inoremap <buffer>( ()<Left>
inoremap <buffer>" ""<Left>
inoremap <buffer>' ''<Left>
inoremap <buffer>[ []<Left>
inoremap <buffer>{ {}<Left><CR><CR><Up><Tab>

"����ļ����
nnoremap <buffer><localleader>mf :call IdlPlugin#MakeHeaderFrame()<cr>
"}}}
"��д����{{{1
"����ͷ�ļ�ע��
inoreabbrev <buffer> ghc /***************************************************************************************************<cr><bs>%fname%:<cr><tab>Copyright (c) Eisoo Software, Inc.(2004 - 2016), All rights reserved.<cr>Purpose:<cr><cr>Author:<cr><tab>wang.zhuowei@eisoo.com<cr><cr><backspace><backspace>Creating Time:<cr><tab>%ctime%<cr><bs>***************************************************************************************************/

"���ɺ���ע��
inoreabbrev <buffer> /** /**<cr>*<cr>* @param<cr>* @throw<cr>* @return<cr>*<cr>**/
"}}}
"��������{{{1
" ��һ��ͷ�ļ��ﴴ��ͨ�ÿ��{{{2
function! IdlPlugin#MakeHeaderFrame()
    if line("$") ==# 1
        normal! :w
        normal! ggdGgg
        normal Ighc
        normal! 2o
        normal! I#include "nsISupports.idl"
        normal! 2o
        normal! I%{ C++
        normal! o
        normal! I%};
        normal! 2o
        normal! :sleep 100ms
        normal ,s
    endif
endfunction
"}}}
"}}}
call CalcModule#EvalArithmeticExp()
