
"""  Good work by Ye(3x faster than original configure)
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

"nmap <F2> :CtrlPMRUFiles<cr>
"nmap <F1> :CtrlPBuffer<cr>

" Disable custom match func in some cases as it's
" - not respecting MRU order in MRU mode
" - not respecting g:ctrlp_by_filename in buffer mode
func! DisableCtrlPMatchFunc(cmd)
    let g:ctrlp_match_func = {}
    execute a:cmd
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endfunc
"nnoremap <F2> :call DisableCtrlPMatchFunc('CtrlPMRUFiles')<CR>
"nnoremap <F1> :call DisableCtrlPMatchFunc('CtrlPBuffer')<CR>

"""https://github.com/FelikZ/ctrlp-py-matcher/blob/master/doc/pymatcher.txt  """
"let g:fuzzy_matcher_type.cur_val='py-matcher'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350
" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif

"""https://github.com/FelikZ/ctrlp-py-matcher/blob/master/doc/pymatcher.txt  """


"" for ag"
nmap <leader>a :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

command Todo Ag! 'TODO|FIXME|CHANGED|BUG|HACK'
command Debug Ag! 'NOTE|INFO|IDEA'
"" for ag"
nmap <leader>a :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

nmap <leader>cad :Calendar<Cr><Cr>

if has("autocmd")
 " Highlight TODO, FIXME, NOTE, etc.
 if v:version > 701
     autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
     autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
 endif
 endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

""https://github.com/tracyone/vinux/blob/master/rc/ctrlp.vim#L30-L65 "
