
autocmd VimEnter *
      \  if !argc()
      \ |   Startify
      \ |   wincmd w
      \ | endif
"at the startify ,when opening a file or bookmark, change to its directory
let g:startify_change_to_dir = 1

" let g:startify_list_order = ['files', 'dir', 'bookmarks', 'sessions',
"     \ 'commands']
let g:startify_list_order = ['files', 'bookmarks', 'sessions',
    \ 'commands']
let g:startify_list_order = [
        \ ['MRU:'],
        \ 'files',
        \ ['   These are my sessions:'],
        \ 'sessions',
        \ ['bookmarks:'],
        \ 'bookmarks',
        \ ['commands:'],
        \ 'commands',
        \ ]

let g:startify_bookmarks = [ 
            \{'c': '~/.vim_runtime/yzl/cleanWind.vim'}, 
            \{'m': '~/.vim_runtime/yzl/cleanPlug.vim'}, 
            \{'r': '~/.vim_runtime/README.md'},   
            \{'d': 'E:\codeRoom\java\designer\README.md'}, 
            \{'w': 'E:\codeRoom\java\tio-site\文档.html'},
            \{'s': 'E:\codeRoom\java\tio-Study\README.md'},
            \{'o': 'E:\codeRoom\java\The-Little-Java\README.md'},
            \{'a': 'E:\codeRoom\SICP-in-Elisp\README.md'},
            \{'f': 'E:\codeRoom\WindFarmSimulation\WFSim-master\README.md'},
            \{'b': 'E:\codeRoom\LiuXinPythonGaussian\FLORISSE-basic\README.md'},
            \{'p': 'E:\codeRoom\perl\README.md'},
            \]
let g:startify_commands = [
    \ ':help reference',
    \ ['Vim Reference', 'h ref'],
    \ {'h': 'h ref'},
    \ ':h easymotion',
    \ ':h easyalign',
    \ ':h leaderf',
    \ ':h incsearch',
    \ ':h operator-flashy.txt',
    \ ':h cursorword',
    \ ':h vim-asterisk',
    \ ':h nerdcommenter',
    \ ':h indexed',
    \ ':h splitjoin',
    \ ':h textobj',
    \ ':h vimwiki',
    \ ':h vim-copy-filename',
    \ ]
