
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

