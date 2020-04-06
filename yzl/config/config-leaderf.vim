
" leaderf rg  very goooood
"" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_PreviewInPopup = 1
"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
let g:Lf_WindowPosition = 'popup'
nmap <C-F> :Leaderf file<cr>
nmap <F1> :Leaderf mru<cr>
noremap <F2> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
noremap <C-S> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
nmap <F7> :Leaderf function<cr>
nmap <F9> :Leaderf marks<cr>
nmap <F10> :Leaderf buffer<cr>

"buffer mru bugTag 
let g:Lf_ShortcutF = "<leader>ff"

noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf marks %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf rg %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>


" should use `Leaderf gtags --update` first
"let g:Lf_GtagsAutoGenerate = 0
"let g:Lf_Gtagslabel = 'native-pygments'
"noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
"noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
"noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
"noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>



