
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
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)


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

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 


function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction



""" for vim-easybar
"easytags   ctags -R ~/.vim
"let g:easytags_file = '~/.vim/tags'

":let g:easytags_cmd = '/usr/local/bin/ctags'
set tags=./tags
let g:easytags_dynamic_files = 1

" 让s跳转到下一个
let g:sneak#s_next = 1
let g:sneak#label =1
