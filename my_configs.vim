nnoremap g<LocalLeader> :call setline(line('.'),substitute(getline('.'),'\\','\/','g'))<CR>
nnoremap gd<LocalLeader> :call setline(line('.'),substitute(getline('.'),'\\','\\\\','g'))<CR>
set rtp+=~/.vim/fzf.exe
set history=1000 ""modify history
if has('mouse')
    set mouse=a
endif

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

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

let g:startify_bookmarks = [ {'c': '~/.vim_runtime/my_configs.vim'}, {'m': '~/.vim_runtime/update_my_plugins.py'}, {'r': '~/.vim_runtime/README.md'}, {'v': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/Java/codeReview/review.wiki'}, 'https://github.com/kana/vim-textobj-user/wiki', {'g': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/Java/notes/gunsNotes.wiki'}, {'o': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/Java/notes/roses.wiki'}, {'w': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/writing/dynamic.wiki'},{'s': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/writing/常用搜索链接.wiki'},{'a': 'C:/Users/yzl/AppData/Roaming/.emacs.d/Dropbox/GTD/Java/architect-awesome/README.md.wiki'}, {'t': 'K:/IntellijHome/t-io/README.md '}, {'j': 'K:/IntellijHome/j-im/README.md '}, {'g': 'https://github.com/CyC2018/CS-Notes'}]
let g:startify_commands = [
    \ ':help reference',
    \ ['Vim Reference', 'h ref'],
    \ {'h': 'h ref'},
    \ ':h easymotion',
    \ ':h easyalign',
    \ ':h ctrlp',
    \ ':h incsearch',
    \ ':h operator-flashy.txt',
    \ ':h cursorword',
    \ ':h vim-asterisk',
    \ ':h nerdcommenter',
    \ ':h indexed',
    \ ':h splitjoin',
    \ ':h textobj',
    \ ':h text object',
    \ ':h vim-copy-filename',
    \ ]

"" for vim-textobj-user
call textobj#user#plugin('datetime', {
\   'date': {
\     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
\     'select': ['ad', 'id'],
\   },
\   'time': {
\     'pattern': '\<\d\d:\d\d:\d\d\>',
\     'select': ['at', 'it'],
\   },
\ })


call textobj#user#plugin('line', {
\   '-': {
\     'select-a-function': 'CurrentLineA',
\     'select-a': 'ao',
\     'select-i-function': 'CurrentLineI',
\     'select-i': 'io',
\   },
\ })

function! CurrentLineA()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')

  let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
  return
  \ non_blank_char_exists_p
  \ ? ['v', head_pos, tail_pos]
  \ : 0
endfunction

"" for vim-copy-filename
nmap <leader>cP :CopyRelativePath<CR>
nmap <leader>cl :CopyRelativePathAndLine<CR>
nmap <leader>cp :CopyAbsolutePath<CR>
nmap <leader>cf :CopyFileName<CR>
nmap <leader>cd :CopyDirectoryPath<CR>

"" diamsg/mark
let g:mwDirectGroupJumpMappingNum = 20
let g:mwDefaultHighlightingPalette = 'extended'

"" for vim-asterisk
"map *   <Plug>(asterisk-*)
"ap #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)
let g:asterisk#keeppos = 1

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"incsearch with easymotion
  " You can use other keymappings like <C-l> instead of <CR> if you want to
  " use these mappings as default search and somtimes want to move cursor with
  " EasyMotion.
" function! s:incsearch_config(...) abort
" return incsearch#util#deepextend(deepcopy({
" \   'modules': [incsearch#config#easymotion#module({'overwin': 1)],
" \   'keymap': {
" \     "\<CR>": '<Over>(easymotion)'
" \   },
" \   'is_expr': 0
" \ }), get(a:, 1, {}))
" endfunction
"
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

""在这里会启动increase-fuzzy函数 converters中定义
noremap <silent><expr> /  incsearch#go(<SID>config_easyfuzzymotion())
noremap <silent><expr> g/ incsearch#go(<SID>config_easyfuzzymotion({'is_stay': 1}))
noremap <silent><expr> ?  incsearch#go(<SID>config_easyfuzzymotion({'command': '?'}))

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

iabbrev xdate <c-r>=strftime("%Y-%m-%d")<cr>

if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
endif

" === Goyo
" changing from the default 80 to accomodate for UndoTree panel
let g:goyo_width = 104

function! s:goyo_enter()
  if has('gui_running')
   ""   :call FullScreen()
   let w:full_screen=1
""   set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    silent !tmux set status off
  endif
  Limelight 0.8
  NERDTreeToggle
endfunction

function! s:goyo_leave()
  if has('gui_running')
   let w:full_screen=0
""    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    silent !tmux set status on
  endif
  Limelight!
  NERDTreeToggle
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" 让s跳转到下一个
let g:sneak#s_next = 1
let g:sneak#label =1

"""  Good work by Ye(3x faster than original configure)
" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

"" https://blog.csdn.net/demorngel/article/details/69054531 
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
"调用ag进行搜索提升速度，同时不使用缓存文件
let g:ctrlp_regexp = 0
"" 不见得提升多少，反而觉得开启indexing变慢
" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   let g:ctrlp_use_caching = 0
" endif
"Ctrlp-funky
"let g:ctrlp_funky_sh_type = 'bash' "default bash    you can set zsh
"  open in which window, 我喜欢在新tag中国
  " t - in a new tab.
  " h - in a new horizontal split.
  " v - in a new vertical split.
  " r - in the current window.
" 
let g:ctrlp_open_new_file = 't'

let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_syntax_highlight = 1
"enable cache
let g:ctrlp_funky_use_cache = 1
" CtrlP for NerdTree
let g:ctrlp_funky_nerdtree_include_files = 1 
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>"

nmap <F2> :CtrlPMRUFiles<cr>
nmap <F1> :CtrlPBuffer<cr>

""" do some adding for filytype
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

let w:full_screen=0

map <F11> :call FullScreen()<CR>

" if has("gui_running") && has("win32")
"     map <F11> :call libcallnr("gvimfullscreen_64.dll", "ToggleFullScreen", 0)<CR>
" endif
"
func! FullScreen()
if w:full_screen==1
let w:full_screen=0
:simalt ~R
else
:simalt ~X
let w:full_screen=1
endif
endfunc

set columns=140
set lines=40
map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt 

map <D-0> :tablast<CR>

"autocmd GUIEnter * simalt ~x
"set lines=34
"if (exists('+colorcolumn'))
    "set colorcolumn=80
""    highlight ColorColumn ctermbg=9
"endif



"" tab encapsulation
" tab 操作
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab切换
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" 新建tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


"""""""""""""""""""""""""""""""""""""""""""""""
"" for wiki
"""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{ 'path': '~/.vim_runtime/vimwiki/', 'path_html': '~/.vim_runtime/vimwiki_html','auto_toc': 1}]
nmap <C-@> <Plug>VimwikiToggleListItem
vmap <C-@> <Plug>VimwikiToggleListItem
let g:vimwiki_folding='list'

let g:vimwiki_hl_cb_checked=1
let g:vimwiki_list_ignore_newline = 0  
"let g:vimwiki_hl_headers = 0  
"
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim/vwtags.py'
          \ , 'ctagsargs': 'all'
          \ }

" default is 15
let g:vimwiki_conceallevel=0

let g:vimwiki_url_maxsave=100

" 设置颜色  
hi VimwikiHeader1 guifg=#FF0000  
hi VimwikiHeader2 guifg=#00FF00  
hi VimwikiHeader3 guifg=#FFFF00  
hi VimwikiHeader4 guifg=#FF00FF  
hi VimwikiHeader5 guifg=#00FFFF  
hi VimwikiHeader6 guifg=#FFFFFF  
"" vimwiki with guifont Droidsansmonofor
"let g:vimwiki_listsyms = ' .oO' 
"let g:vimwiki_listsyms = '.oOX' "the default value
"" for vim-move
let g:move_key_modifier = 'C'

"" v visual   0  start of line    x: delete  k: move cursor upper line  $:
"$" last column   a: input words
nmap <F8> O<ESC>O<ESC>jO- Brief Summary(by yzl):<CR><ESC>0d$i{{{<CR><Tab><CR><ESC>v0xk$a1. so what?
nmap <F7> <ESC>o(TODO(yzl))<ESC>

"nmap <C-a> gg0vG$
"
"MyInfoMation
let g:BASH_AuthorName ='Ye Zhaoliang'
let g:BASH_Email      ='zhaoturkkey@163.com'
let g:BASH_Company    ='NCEPU'
let g:BASH_SyntaxCheckOptionsGlob  = "-O extglob"
let g:BASH_Debugger     = 'ddd'


""for rainbow_parenthese"
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""
""" for unite
"""""""""""""""""""""""""""""""""""""""""""""""

"for vimfiler
let g:vimfiler_enable_auto_cd=1
"call vimfiler#set_execute_file('txt', 'notepad')
call vimfiler#set_execute_file('txt', 'gvim')
call vimfiler#set_execute_file('c', ['gvim', 'notepad'])

let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
" Edit file by tabedit.
"call vimfiler#custom#profile('default', 'context', {
"      \ 'safe' : 0,
"      \ 'edit_action' : 'tabopen',
"      \ })

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

let g:vimfiler_safe_mode_by_default=0 
	" Use trashbox.
	" Windows only and require latest vimproc.
let g:unite_kind_file_use_trashbox = 1
""  you can create a .vim file, then source it
"need everything.exe
"nnoremap <Leader>f :Unite file buffer file_rec file_mru everything<CR>
nnoremap <Leader>f :VimFiler<CR>
nnoremap <leader>l :Unite line<CR>
"let g:unite_source_everything_limit = 100
"let g:unite_source_everything_full_path_search = 1
"let g:unite_source_everything_posix_regexp_search = 1
"let g:unite_source_everything_async_minimum_length = 3
"let g:unite_source_everything_cmd_path = $HOME.'\\.vim\\es\\es.exe'


""" for vim-easybar
"easytags   ctags -R ~/.vim
"let g:easytags_file = '~/.vim/tags'

":let g:easytags_cmd = '/usr/local/bin/ctags'
set tags=./tags
let g:easytags_dynamic_files = 1

" for comfortable-motion
let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

nnoremap <silent> <C-e> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(100)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-100)<CR>
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>

"" for ag"
nmap <leader>a :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag 

nmap <leader>cad :Calendar<Cr><Cr>


let $PYTHONHOME = 'c:\\Python37\\'
let g:pymode_python = 'C:\\Python37\\python.exe'

"let mapleader= "<SPACE>" 

command Todo Ag! 'TODO|FIXME|CHANGED|BUG|HACK'
command Debug Ag! 'NOTE|INFO|IDEA' 
if has("autocmd")
 " Highlight TODO, FIXME, NOTE, etc.
 if v:version > 701
     autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
     autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
 endif
 endif

set nocompatible
filetype plugin on
syntax on
filetype indent on

