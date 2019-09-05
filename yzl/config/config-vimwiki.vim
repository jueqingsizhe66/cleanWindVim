
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
          \ , 'ctagsbin':'~/.vim_runtime/vwtags.py'
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


nmap <leader>cad :Calendar<Cr><Cr>
