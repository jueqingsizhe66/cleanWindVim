" python"

let g:pydiction_location='~/.vim_runtime/yzl/my_plugins/pydiction/complete-dict'
let g:pydiction_menu_height=20

call mmtemplates#config#Add ( 'perl', '~/.vim_runtime/Templates/perl.templates', 'example', 'nte' )
call mmtemplates#config#Add ( 'sh', '~/.vim_runtime/Templates/sh.templates', 'example', 'nte' )
call mmtemplates#config#Add ( 'latex', '~/.vim_runtime/Templates/latex.templates', 'example', 'nte' )
call mmtemplates#config#Add ( 'c', '~/.vim_runtime/Templates/c.templates', 'example', 'nte' )
call mmtemplates#config#Add ( 'awk', '~/.vim_runtime/Templates/awk.templates', 'example', 'nte' )

" jedi.vim use default
" "" Very important
set encoding=utf-8
set fileencodings=utf-8
