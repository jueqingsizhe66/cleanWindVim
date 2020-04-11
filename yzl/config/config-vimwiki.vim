
"let g:vimwiki_list = [{ 'path': '~/.vim_runtime/vimwiki/', 'path_html': '~/.vim_runtime/vimwiki_html','auto_toc': 1, 'syntax':'markdown'}]
let g:vimwiki_list = [{ 'path': '~/.vim_runtime/vimwiki/', 'path_html': '~/.vim_runtime/vimwiki_html','auto_toc': 1, 'syntax':'default'}]

"Code block for markdown
" \1  slash 会提示要使用哪个
"autocmd FileType vimwiki let b:surround_45 = "{{{java {\1tx \1} \n\r\n}}}"
autocmd FileType vimwiki let b:surround_45 = "{{{java\n\n}}}"

" vertical |
autocmd FileType vimwiki let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
"Code block for markdown
 autocmd FileType markdown let b:surround_45 = "```\n\r\n```"

"Block comment for python
 autocmd FileType python let b:surround_45 = "\"\"\"\n\r\n\"\"\""
nmap <C-@> <Plug>VimwikiToggleListItem
vmap <C-@> <Plug>VimwikiToggleListItem
let g:vimwiki_folding='list'

let g:vimwiki_hl_cb_checked=1
let g:vimwiki_list_ignore_newline = 0
"let g:vimwiki_hl_headers = 0
"
" https://github.com/universal-ctags/ctags-win32/releases 
"  ctags更新了
"  https://github.com/universal-ctags/ctags 
"  https://docs.ctags.io/en/latest/ 
let g:tagbar_type_vimwiki = {
          \   'ctagstype':'vimwiki'
          \ , 'kinds':['h:header']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header'}
          \ , 'sort':0
          \ , 'ctagsbin':'~/.vim_runtime/vwtags.py'
          \ , 'ctagsargs': 'default'
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
