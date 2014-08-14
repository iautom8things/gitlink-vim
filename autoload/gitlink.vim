"=============================================================================
" File: gitlink.vim                                                          =
" Author: Manuel Zubieta <mazubieta@gmail.com>                               =
" Created Date: 2014-08-14                                                   =
" Version: 0.1                                                               =
" WebPage: http://github.com/mazubieta/gitlink-vim                           =
" License: MIT                                                               =
"=============================================================================

function! gitlink#GitLink()
    let l:hash = substitute(system("git rev-parse HEAD"),"\n","","")
    let l:line = line('.')
    let l:path = expand("%:p")
    let l:root = substitute(system("git rev-parse --show-toplevel"),"\n","","")
    let l:file= substitute(l:path,l:root,"","")
    let l:repoURL = substitute(system("git config --get remote.origin.url"),".git\n","","")
    let l:final = l:repoURL . "/tree/" . l:hash . l:file . "#L" . l:line
    echo l:final
endfunction
