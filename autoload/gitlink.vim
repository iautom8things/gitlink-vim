"=============================================================================
" File: gitlink.vim                                                          =
" Author: Manuel Zubieta <mazubieta@gmail.com>                               =
" Created Date: 2014-08-14                                                   =
" Version: 0.1                                                               =
" WebPage: http://github.com/mazubieta/gitlink-vim                           =
" License: MIT                                                               =
"=============================================================================

function! gitlink#GitLink()
    let l:hash = substitute(system("git rev-parse HEAD 2>/dev/null"),"\n","","")
    if l:hash != ''
        let l:line = line('.')
        let l:path = expand("%:p")
        let l:root = substitute(system("git rev-parse --show-toplevel"),"\n","","")
        let l:file= substitute(l:path,l:root,"","")
        let l:remote = substitute(system("git config --get remote.origin.url"), ".git\n", "", "")
        if match(l:remote, '^https://') != -1
            let l:repoURL = l:remote
        elseif match(l:remote, '^git@') != -1
            let l:repoURL = substitute(l:remote,"^git@","https://","")
        elseif match(l:remote, '^ssh://') != -1
            let l:repoURL = substitute(l:remote,"^ssh://","https://","")
        elseif match(l:remote, '^git:') != -1
            let l:repoURL = substitute(l:remote,"^git:","https://","")
        endif
        let l:final = l:repoURL . "/tree/" . l:hash . l:file . "#L" . l:line
        return l:final
    endif
    return ''
endfunction
