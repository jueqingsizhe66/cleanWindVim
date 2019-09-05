
vim真正教会了你什么？

vim带给你激情，也给了你生活的智趣，从一开始你练习[Learn-vim-progressively][1],并且现在还在练习macro和vim's text object.
也在不断的学习marks and tags思想，让生活轨迹有迹可循，你使用[CtrlSpace](#ctrlspace)来保证你的workspace保存下来，并切换文件和buffer；
随着知识的增长，你使用[vimwiki](#vimwiki)来管理你的知识，并结合[calendar][5]在vimwiki来管理你的日记。为了让文件查找，文件编辑更加方便，你使用
[shoudo][9]的[vimfiles][8]来增强你的vim，使得你的vim变得更像一把瑞士军刀。

为了多一点对称美，你使用高丽棒作者[junegunn][10]的[vim-easy-align][11] (<font color="red">Note: [many examples][26]</font>),为了少犯错误，你加入了[vim-fat-finger][4],使用iabbrev来缩写你需要写的单词，或者修正错误的单词,为了编辑更加有效,你甚至引入了[vim-multiline-cursor][16], 并进一步的你引入了[tpope][20]的[vim-surround][17]让你在书写racket(当然你也可以使用[delimiteMate][28]补全括号插件)或者lisp代码的时候更加方便一些，并为了重复或者递归使用，你也引入他的[vim-repeat][18] (vim中的很多插件都是支持增强的，比如f的增强插件[clever-f][19]);为了更快捷的编辑文件行，除了使用vim text object, 你也引入了[vim-move][22]和[vim-easymotion][27] (<font color="red">Very Good</font>)来移动行,使得vim文本更加结构化。

想着让你的vim运行得更快一些，你把你一直用的[vundle][6]改为了的[junegunn][10][vim-plug][7]来管理你的插件,确没见得有太大的改进，简洁地使用plugins自然就快了。


![MyBeautifulVim][24]

可以看到你的其实也增加了[Startify](#star)的配置。

然而，上面这些都是你想让vim做的，下面要写的则是<font color="red">vim plugins带给你关于写作的新的概念和思想</font>，这也才是本文的重点。

+ [1. Ctrl-Space Plugin](#ctrl-space)
+ [2. Knowledge tool: Vimwiki](#vimwiki)

<!--more-->

刚开始接触vim的时候，你是用了scrooloose的[nerdtree][12] ,[tagbar][13],[vim airline][14]等，你也使用了各种[language support vim plugins][21],也知道vim使用[tpope][20]的[vim-gitgutter][15]结合git管理code, 现在让我们来看第一个vim插件ctrl-space

<h3 id="ctrlspace"> 1. Ctrl-Space Plugin</h3>

Github Repo: Click [here][2]

<font color="red">核心概念:</font>

当你在vim中使用`:h ctrlspace`时候会搜索到这些资料，

```
【1.vim desktop】: Let's imagine [ Vim ] is a writing desk. 
【2.projects draws】 : Your [ projects ] are like drawers. 
【3.Bookmark  favorite project】:  The [ Bookmark ] List simply displays your favorite projects.
【4.Buffer  paper】: A [ buffer ] is like a sheet of paper lying on the desk. 
        named buffers
        unsaved buffers
【5.workspace  an status snapshot of current project】:All your [ buffers ], [ tabs ], and [ tab ] layouts can be persisted as a workspace.
It's like taking a picture of your desk with an instant camera. You can
save multiple workspaces per project with Workspace List.
【6.workspace  session】 : The word "workspace" can be considered a synonym of a "session". The
ability of having so many sessions available at hand creates a lot of
interesting use cases! For example, you can have a workspace for each task
or feature you are working on. It's very easy to switch from one workspace
to another.
```

```

然后以后可以使用大写的B，跳转到Bookmark标签栏，类似于CtrlSpace的哲学思想，会跳转到某个bookmark下的目录，通过C也可以，直接Enter《CR》键也是可以的。
删除觉得不需要了，就D一下即可。
```

<tag>: The easiest way to think about tab pages in Vim is to consider them to be viewports, layouts, or workspaces 

```
tags是一个在编程中经常会使用
而且在git的版本中也经常涉及到很多打tag的工作 (git tag  or  git tag  -a)   git checkout某个tag等

其实tags只不过是对事物的一种抽象，这也是你在现实当中经常看到的class field method 注释等等，其实都可以把他们理解为一种tag，一种convinience tag
```

在vimwiki的wiki文件的简单实用方法(经常用！！！):

```
:标签名字:

[[文件名#标签名字]]即可
```

相同vim tag概念
```

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


```


#### 默认工作类型目录

```
Markers will be also used as a storage for `cs_workspaces` (workspaces of
the current project) and `cs_files` (cached files of the current project).

Default value: >

    let g:CtrlSpaceProjectRootMarkers = [
         \ ".git",
         \ ".hg",
         \ ".svn",
         \ ".bzr",
         \ "_darcs",
         \ "CVS"
         \ ]
```

<font color="RED">Summary:</font>

```
   A buffer is the in-memory text of a file.
   A window is a viewport on a buffer.
   A tab page is a collection of windows.


A window is a viewport onto a buffer.  You can use multiple windows on one
buffer, or several windows on different buffers.

A buffer is a file loaded into memory for editing.  The original file remains
unchanged until you write the buffer to the file.

```

<h3 id="vimwiki">Knowledge tool: Vimwiki</h3>
Github Repo: Click [here][3]



#### vimwki setup in vimrc:

```
• """"""""""""""""""""""""""""""""""""""""""""""""""  
• " vimwiki  
• let g:vimwiki_use_mouse = 1  
• let g:vimwiki_list_ignore_newline = 0  
• let g:vimwiki_hl_headers = 0  
• " vimwiki打开折叠  
• "let g:vimwiki_folding = 1  
• let g:vimwiki_camel_case = 0  
• let g:vimwiki_list_ignore_newline = 0  
• let g:vimwiki_CJK_length = 1  
•   
• "设定文件浏览器目录为当前目录  
• set bsdir=buffer      
• "set autochdir  
•   
• " 日历插件  
• map ca :Calendar<cr>  
•   
• map <S-Space> :<C-Space>  
•   
• " vimwiki  
• let g:vimwiki_list = [{'path': '~/Wiki/wiki/', 'path_html': '~/Wiki/', 'auto_export': 1}]  
• " 转化为Html文件  
• map <S-F4> :Vimwiki2HTML<cr>  
•   
• " 设置颜色  
• hi VimwikiHeader1 guifg=#FF0000  
• hi VimwikiHeader2 guifg=#00FF00  
• hi VimwikiHeader3 guifg=#0000FF  
• hi VimwikiHeader4 guifg=#FF00FF  
• hi VimwikiHeader5 guifg=#00FFFF  
hi VimwikiHeader6 guifg=#FFFF00  
```


#### vimwiki tagbar 集成

```
------------------------------------------------------------------------------
Tagbar integration                                            *vimwiki-tagbar*

As an alternative to the Table of Contents, you can use the Tagbar plugin
(http://majutsushi.github.io/tagbar/) to show the headers of your wiki files
in a side pane.
Download the Python script from
https://raw.githubusercontent.com/vimwiki/utils/master/vwtags.py and follow
the instructions in it.
```

效果如下，

![tagbar][23]


<h3 id="vimfiler"> </h3>

Github Repo: click [ here ][8]

vimfiler setup in vimrc

```
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
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_tree_opened_icon = '▾'
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
let g:unite_source_everything_limit = 100
let g:unite_source_everything_full_path_search = 1
let g:unite_source_everything_posix_regexp_search = 1
let g:unite_source_everything_async_minimum_length = 3
let g:unite_source_everything_cmd_path = 'C:\\Users\\YeZhao\\.vim\\es\\es.exe'



```

由于vimfiler的使用也了解到了 [ag][34]插件（一个特别好用的搜索插件）

```
H作用打开shell  x打开文件夹的意思

L打开磁盘
Load
&回到project目录  那是相当有用的
~回到.vim目录

e编写文件
N 创建文件
K创建文件夹

#全选
*全部选？

c复制
d删除
m移动

先用m表示选定 然后d删除(重要操作)
m移动
c复制
```

<strong><u>有意思的是:</u></strong>

使用m然后r，可以跳出一个新的编辑窗口，进行文件名的修改，这是相当好的实现。


转化为HTML

``` vim
:Vimwiki2HTML – Convert current wiki page to HTML
:VimwikiAll2HTML – Convert all your wiki pages to HTML
```


<h3 id="star"> Startify Plugin</h3>

Github Repo: click [ here ][25]

#### vim 全屏

``` vim
let w:full_screen=0
    map :call FullScreen()
func! FullScreen()
    if w:full_screen==1
    let w:full_screen=0
    :simalt ~R
    else
    :simalt ~X
    let w:full_screen=1
    endif
endfunc
```

#### vim-easy-align常用命令

```

```

#### vim-surround 常用命令

```
1. cs"'
2. cs'"
3. cs'<q>
4. cst"
5. cs"t
6. ds"
7. ysiw"
8. yssb == yss)  
9. S"  可视化模式选择快 然后大S，这点类似于Multiple-Cursor的Ctrl+N命令
```

#### vim copy file name

你使用[vim-copy-filename][33]
```
"" for vim-copy-filename
nmap <leader>cp :CopyRelativePath<CR>
nmap <leader>cl :CopyRelativePathAndLine<CR>
nmap <leader>cP :CopyAbsolutePath<CR>
nmap <leader>cf :CopyFileName<CR>
nmap <leader>cd :CopyDirectoryPath<CR>
```


额外一些插件的备注

1. [ Haya14busa ][30]提供的[ incsearch ][29] 增加了statusline的查找词当前数 和总个数
2. [ Vim-cursorword ][31]表示添加下划线。
3. [ AndrewRadev/splitjoin.vim  ][32]是提供类似于perl的当行模式的插件[gS gJ]。在scheme估计比较少用到。


一直遗忘的一个快捷查看命令
`Ctrl+E` 往下滚屏  `Ctrl+Y` 往上滚屏

```
运行的话,进入底线命令模式,用:!perl %就可以运行,或者可以绑定一个快捷键组合, %表示当前文件的意思
```

最后，编辑器界面展示的应全是代码，不应该有<u>工具条、菜单、滚动条</u>浪费空间的元素，另外，编程是种<font color="red">精神高度集中的脑力劳动</font>，不应出现<s>闪烁光标、花哨鼠标</s>这些分散注意力的东东 


#### Attach File

MyPlug Mangment File:

```
call plug#begin('~/.vim/bundle')

"" where to store the plugins
"------------------
" Code Completions
"------------------
Plug 'Shougo/neocomplcache'
"Plug 'Shougo/neocomplete'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
"Plug 'honza/snipmate-snippets'
Plug 'scrooloose/snipmate-snippets' 
"python
"Plug 'honza/vim-snippets'
"Plug 'mattn/zencoding-vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/webapi-vim'
Plug 'Raimondi/delimitMate'
"------ snipmate dependencies -------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

"-----------------
" Fast navigation
"-----------------
"Plug 'edsono/vim-matchit'
Plug 'jwhitley/vim-matchit'

Plug 'Lokaltog/vim-easymotion'

"--------------
" Fast editing
"--------------
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

"--------------
" IDE features
"--------------
Plug 'scrooloose/nerdtree'
"Plug 'humiaozuzu/TabBar'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-powerline'
Plug 'scrooloose/syntastic'
Plug 'bronson/vim-trailing-whitespace'

"-------------
" Other Utils
"-------------
" Plug 'humiaozuzu/fcitx-status'
Plug 'nvie/vim-togglemouse'


"--------------
" Color Schemes
"--------------
Plug 'rickharris/vim-blackboard'
Plug 'altercation/vim-colors-solarized'
Plug 'rickharris/vim-monokai'
Plug 'tpope/vim-vividchalk'
Plug 'Lokaltog/vim-distinguished'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fisadev/fisa-vim-colorscheme'
"Plug 'https://github.com/jueqingsizhe66/Pydiction.git'
Plug 'rkulla/pydiction'
"Plug 'https://github.com/jueqingsizhe66/cscope.vim'
Plug 'brookhong/cscope.vim'

"-----------------Here it all works without python

"------- web frontend ----------
Plug 'othree/html5.vim'
" Plug 'tpope/vim-haml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'nono/jquery.vim'
" Plug 'groenewege/vim-less'
" Plug 'wavded/vim-stylus'
" Plug 'nono/vim-handlebars'

"------- markup language -------
Plug 'tpope/vim-markdown'
" Plug 'timcharper/textile.vim'

"-----------------Here it all works without python
"
"

"------- FPs ------
Plug 'kien/rainbow_parentheses.vim'
" Plug 'wlangstroth/vim-racket'
" Plug 'vim-scripts/VimClojure'
" Plug 'rosstimson/scala-vim-support'


"fortran"
"Plug 'https://github.com/jueqingsizhe66/fortran_line_length.vim'
"Plug 'caglartoklu/fortran_line_length.vim'
"Plug 'https://github.com/jueqingsizhe66/fortran.vim'
"Plug 'https://github.com/jueqingsizhe66/fortran_codecomplete.vim'
"Plug 'vim-scripts/fortran.vim'
"something wrong 5/6
"Plug 'vim-scripts/fortran_codecomplete.vim'
" fortran
Plug 'xiexinyls/vim'

"matlab
Plug 'elmanuelito/vim-matlab-behave'

"" -------------------Here above all can be done without python
"I increase
"2015-4-29

" bash and perl support has been existed in the WolfgangMehner/vim-plugins
"Plug 'vim-scripts/bash-support.vim'
"Plug 'vim-scripts/perl-support.vim'

"---Ok
"Plug 'artur-shaik/vim-javacomplete2'
Plug 'kovisoft/slimv'

Plug 'vim-perl/vim-perl'
Plug 'WolfgangMehner/vim-plugins'

Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
Plug 'lukerandall/haskellmode-vim'
"Plug 'vim-scripts/LaTex-Suite-aka-Vim-LaTex'
Plug 'lervag/vimtex'
Plug 'jcf/vim-latex'



Plug 'adimit/prolog.vim'

"marker
"Plug 'xsunsmile/showmarks'
Plug 'kshenoy/vim-signature'
Plug 'dimasg/vim-mark'
"git 1
Plug 'airblade/vim-gitgutter'

Plug 'skwp/greplace.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'

"multicursor
Plug 'terryma/vim-multiple-cursors'
"python snippts~important
"Plug 'SirVer/ultisnips'
"racket
Plug 'wlangstroth/vim-racket'
Plug 'vim-scripts/scribble.vim'
"Plug 'http://www.vim.org/scripts/script.php?script_id=197'
"delete parts for lookupfile ,use CtrlP instead  and CtrlPFunc
"Plug 'vim-scripts/genutils'
"Plug 'vim-scripts/multvals.vim'
"Plug 'vim-scripts/lookupfile'  "2010 deleted
" genutils can create tag for vim and lookupfile
"Plug 'oldguan/CreateTags'


Plug 'dbmrq/vim-chalk'

""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""support csv


Plug 'chrisbra/csv.vim'

Plug 'tacahiroy/ctrlp-funky'

" For java
Plug 'yuratomo/java-api-complete'
Plug 'yuratomo/java-api-javax'
Plug 'yuratomo/java-api-org'
Plug 'yuratomo/java-api-sun'
Plug 'yuratomo/java-api-servlet2.3'
"Plug 'yuratomo/java-api-android'
Plug 'yuratomo/java-api-junit'

"strength the NerdTree, multiTags with one NerdTree
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-ctrlspace/vim-ctrlspace'

Plug 'tpope/vim-repeat'

"strength the tarbar
"Plug 'xolox/vim-easytags'
"Plug 'xolox/vim-misc'
"Plug 'elentok/todo.vim'
Plug 'freitass/todo.txt-vim'

Plug 'mhinz/vim-startify'

":MRU
Plug 'vim-scripts/mru.vim'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
"sources for unite
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
Plug 'sgur/unite-everything'
" Plug 'Shougo/vimproc.vim', {
" \ 'build' : {
" \     'windows' : 'tools\\update-dll-mingw',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make',
" \     'linux' : 'make',
" \     'unix' : 'gmake',
" \    },
" \ }
"
"
"" abbre
Plug 'chip/vim-fat-finger'

Plug 'wannesm/wmgraphviz.vim'
Plug 'vim-scripts/gnuplot.vim'
Plug 'mdlerch/vim-gnuplot'
" R lanagage
Plug 'jalvesaq/Nvim-R'
"Plug 'vim-scripts/Vim-R-plugin'
Plug 'wdicarlo/vim-notebook'
Plug 'vimoutliner/vimoutliner'

Plug 'vimwiki/vimwiki'
"" code align vertical bar
Plug 'Yggdroot/indentLine'

" modve the code textobject
Plug 'matze/vim-move'

"" update the operation of f and F t and T
Plug 'rhysd/clever-f.vim'

"" color to let you look better  set termguicolors
Plug 'romainl/Apprentice'

"Plug 'itchyny/calendar.vim'
Plug 'mattn/calendar-vim'


Plug 'junegunn/vim-easy-align'

Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-speeddating'

Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
""for conventer
Plug 'haya14busa/incsearch-fuzzy.vim'

Plug 'haya14busa/vim-asterisk'
"" see your yawed part
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

"" underline the word at the current current
Plug 'itchyny/vim-cursorword'
Plug 'henrik/vim-indexed-search'

Plug 'AndrewRadev/splitjoin.vim'

" another kana object

Plug 'kana/vim-textobj-user'
"" va` vi`
""Plug 'fvictorio/vim-textobj-backticks'
Plug 'jceb/vim-textobj-uri'
Plug 'kana/vim-textobj-fold'


"" copy filename
Plug 'AdamWhittingham/vim-copy-filename'

Plug 'vim-scripts/txt.vim'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'will133/vim-dirdiff'

call plug#end()


filetype plugin indent on     " required!

```


My .vimrc File:


```
"source ~/.vim/bundles.vim
source ~/.vim/autoload/plug.vim
source ~/.vim/myPlugManage.vim
let mapleader=','
"default mapleader is \ ,but I don't like it

"MyInfoMation
let g:BASH_AuthorName ='Ye Zhaoliang'
let g:BASH_Email      ='zhaoturkkey@163.com'
let g:BASH_Company    ='NCEPU'
let g:BASH_SyntaxCheckOptionsGlob  = "-O extglob"
let g:BASH_Debugger     = 'ddd'

" wheng guangbiao stand still,stop highlight
autocmd cursorhold * set nohlsearch
"start hightlight
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
"noremap * *:set hlsearch<cr>
"emmet vim
let g:user_emmet_leader_key='<leader>q'
let g:user_emmet_install_global =0

"for  Todo.txt
let g:todo_root="D:\Todo"
autocmd FileType html,css EmmetInstall
"let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))
"let g:user_emmet_leader_key='<C-Z>,'
" encoding dectection
"Plugin 'mattn/emmet-vim'
"racket
au! BufRead,BufNewFile *.scrbl setfiletype scribble
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set foldmethod=manual
"set foldmethod=indent
"set foldmethod=marker
"gitgutter
let g:gitgutter_max_signs=1000
"vim-mark hightlight
let g:mwDefaultHighlightingPalette='extended'
let g:mwDefaultHighlightingNum=9
let g:mwDefaultHighlightPalette = [{'ctermbg':'Cyan','ctermfg':'Black','guibg':'#8CCBEA','guifg':'Black'}]
let g:mwAutoLoadMarks=1
let g:mwAutoSaveMarks=1
set viminfo+=%
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8 
" enable filetype dectection and ft specific plugin/indent
if has("autocmd")
    filetype plugin indent on
endif

if has('mouse')
    set mouse=a
endif

" enable syntax hightlight and completion
syntax on


"--------
" Vim UI
"--------
" color scheme
set background=dark

"color vividchalk  "the default setting  But Ichange it by zhaolaing
"color distinguished
"color monakai
"color blackboard
color solarized
let g:solarized_termcolors=256
"color fisa

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase

set nobackup 
" editor settings
set history=1000
set nocompatible
"set nofoldenable                                                 "disable folding
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
" I try to modify withe wrap
set wrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber


"fortran setting by zhaoliang"
"fortran's setting for rules
 "去掉固定格式每行开头的红色填充
let fortran_have_tabs = 1
"fortran folder setting"
let fortran_fold =1
let fortran_more_precise=1
let fortran_do_enddo=1
"auto to open the neocomplet"
"let g:NeoComplCache_EnableAtStartup=1
""""""""""""""""""""""""""""""""""""""""""""""""''''"
" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion, which require computational power and may stall the vim. 
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" syntax support
autocmd Syntax javascript set syntax=jquery   " JQuery syntax support
" js
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

let g:pydiction_menu_height = 20

"-----------------
" Plugin settings
"-----------------
" Rainbow parentheses for Lisp and variants
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
autocmd Syntax lisp,scheme,clojure,racket RainbowParenthesesToggle

" tabbar
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1

hi Tb_Normal guifg=white ctermfg=white
hi Tb_Changed guifg=green ctermfg=green
hi Tb_VisibleNormal ctermbg=252 ctermfg=235
hi Tb_VisibleChanged guifg=green ctermbg=252 ctermfg=white

" easy-motion
let g:EasyMotion_leader_key = '<Leader>'

" Tagbar
let g:tagbar_ctags_bin='~/.vim/ctags.exe'
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" tag for coffee
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }

  let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'sort' : 0,
    \ 'kinds' : [
        \ 'h:sections'
    \ ]
    \ }
endif
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

" cscope setting
" 2014-5-4x xintianjia 

if has("cscope")
   set csprg="D:\Program Files (x86)\Vim\vim80\cscope"              "指定用来执行 cscope 的命令
   set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
   set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
   set nocsverb                           "不显示添加数据库是否成功
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out                   "添加cscope数据库
   endif
   set csverb                             "显示添加成功与否
endif
"cscope"
   " in case your cscope execute is not in system path.
    " let g:cscope_cmd = 'D:/tools/vim/cscope.exe'
    " s: Find this C symbol
    map <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
    " g: Find this definition
    map <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
    " d: Find functions called by this function
    map <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
    " c: Find functions calling this function
    map <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
    " t: Find this text string
    map <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
    " e: Find this egrep pattern
    map <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
    " f: Find this file
    map <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
    " i: Find files #including this file
    map <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
    map <leader>l :call ToggleLocationList()<CR>

"quickfix"
nmap <F7> :cn<cr>
nmap <F8> :cp<cr>

" Nerd Tree
let NERDChristmasTree=0
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"

" nerdcommenter
let NERDSpaceDelims=1
" nmap <D-/> :NERDComToggleComment<cr>
let NERDCompactSexyComs=1

" ZenCoding
let g:user_zen_expandabbr_key='<C-j>'

" powerline
"let g:Powerline_symbols = 'fancy'

" NeoComplCache
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
"let g:neocomplcache_enable_underbar_completion = 1
"let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

" 
set path=**,e:/matlab-develop/**;

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete

" SuperTab
"let g:SuperTabDefultCompletionType='context'
let g:SuperTabDefaultCompletionType = '<C-X><C-U>'
let g:SuperTabRetainCompletionType=2

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store  " MacOSX/Linux
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Keybindings for plugin toggle
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap  <D-/> :
"nnoremap <leader>a :Ack
nnoremap <leader>a :Ack!<SPACE>
vmap <C-c> "+y    
nmap <C-v> "+p    
"nmap <C-a> gg0vG$


nnoremap <leader>v V`]

nmap <F8> ggO!!-*-coding:utf8-*-<CR>!     @Date    : <Esc>:read !date<CR>kJ<CR>i!     @email   : zhaoturkkey@163.com<CR>!     @author  : Ye zhaoliang<CR>!     @usage   :<CR>!          <CR>!     @input   : <CR>!          <CR>!     @outcome : <CR>!         <CR>!     @purpose : <CR>!        

"map by zhaoliang~~
"------------------
" Useful Functions
"------------------
" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" for macvim
if has("gui_running")
    set go=aAce  " remove toolbar
    "set transparency=30
    set guifont=Monaco:h13
    set showtabline=2
    set columns=140
    set lines=40
    noremap <D-M-Left> :tabprevious<cr>
    noremap <D-M-Right> :tabnext<cr>
    map <D-1> 1gt
    map <D-2> 2gt
    map <D-3> 3gt 
    map <D-4> 4gt
    map <D-5> 5gt
    map <D-6> 6gt
    map <D-7> 7gt
    map <D-8> 8gt
    map <D-9> 9gt
    map <D-0> :tablast<CR>
endif
"Bundle "https://github.com/vim-scripts/indentpython.vim--nianyang.git" 
let g:haddock_browser="/usr/bin/opera"
let g:haddock_docdir="/home/happycamp-of-lisp/doc"

let w:full_screen=0

map <F11> :call FullScreen()<CR>

func! FullScreen()
if w:full_screen==1
let w:full_screen=0
:simalt ~R
else
:simalt ~X
let w:full_screen=1
endif
endfunc
"map <F11> :call AddFortranTitle()<cr>' s
"function AddFortranTitle()
"   call append(0,"!zhao*****************************************************!")
"   call append(1,"!                       DATA_READER                       !")
"   call append(2,"!            ---------------------------------            !")
"   call append(3,"!                     >>>>> SUBS <<<<<                    !")
"   call append(4,"!*********************************************************!")
"   echohl WarningMsg | echo "Successful in adding  the copyright."|echohl None
"endf
map <F8> o!zhao*****************************************************!<CR>!                       DATA_READER                       !<CR>!            ---------------------------------            !<CR>!                     >>>>> SUBS <<<<<                    !<CR>!*********************************************************!<CR><ESC>

"function AddFortranTitle()
"   i!zhao*****************************************************!<CR>
"   !                       DATA_READER                       !<CR>
"   !            ---------------------------------            !<CR>
"   !                     >>>>> SUBS <<<<<                    !<CR>
"   !*********************************************************!<CR>
"endf


"map <F9> :call AddFortranPart()<cr>' s
"function AddFortranPart()
"    call append(0,"!            ---------------------------------            !")
"    call append(1,"!                   PART1. FAST_WT MODEL                  !")
"    call append(2,"!            ---------------------------------            !")
"    call append(3,"!            ---------------------------------            !")
"    call append(4,"!                         LOAD DATA                       !")
"    call append(5,"!            ---------------------------------            !")
"    echohl WarningMsg | echo "Successful in adding  the copyright."|echohl None
"endf

map <F10> o!            ---------------------------------            !<CR>!                   PART1. FAST_WT MODEL                  !<CR>!            ---------------------------------            !<CR>!            ---------------------------------            !<CR>!                         LOAD DATA                       !<CR>!            ---------------------------------            !<CR><ESC>




" add and update the tile
map <F9> :call TitleDet()<cr>' s


function AddTitle()
    call append(0,"/*===================================================================")
    call append(1,"#")
    call append(2,"# Author : Ye Zhaoliang -- zhaoturkkey@163.com")
    call append(3,"#")
    call append(4,"# QQ : 977962857@qq.com ")
    call append(5,"#")
    call append(6,"# Last modified:	".strftime("%Y-%m-%d %H:%M"))
    call append(7,"#")
    call append(8,"# Filename:    ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: ")
    call append(11,"#")
    call append(12,"===================================================================*/")
    echohl WarningMsg | echo "Successful in adding  the copyright."|echohl None
endf

" update the newest modified time and filename
"" the same  to normal '' to signal the position by vim(gvim)
function UpdateTitle()
    normal m'   
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updateing the copyright." | echohl None
endfunction

" determine whether there are "Last modified" words before the first 10 lines
" or not/
" If not ,it means there are no author information
" If yes, update it

function TitleDet()
    let n=1
    " default add
    while n < 10
        let line=getline(n)
        if line=~'^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n+1
    endwhile
    call AddTitle()
endfunction

"""""""""""""""""""""""""""""""""
"           其他设置            "
"""""""""""""""""""""""""""""""""
" 保存代码文件前自动修改最后修改时间
au BufWritePre *.sh
  \ call TimeStamp('#')
au BufWritePre .vimrc,*.vim
  \ call TimeStamp('"')
au BufWritePre *.c,*.h
  \ call TimeStamp('*')
au BufWritePre *.cpp,*.hpp
  \ call TimeStamp('//')
au BufWritePre *.f90
  \ call TimeStamp('!')
au BufWritePre *.m
  \ call TimeStamp('%{','%}')
au BufWritePre *.prolog,*.pro
  \ call TimeStamp('//')
au BufWritePre *.cxx,*.hxx
  \ call TimeStamp('//')
au BufWritePre *.java
  \ call TimeStamp('//')
au BufWritePre *.rb
  \ call TimeStamp('#')
au BufWritePre *.py
  \ call TimeStamp('#')
au BufWritePre Makefile
  \ call TimeStamp('#')
au BufWritePre *.php
  \ call TimeStamp('<?php //', '?>')
au BufWritePre *.html,*htm
  \ call TimeStamp('<!--', '-->')

" Last change用到的函数，返回时间，能够自动调整位置
function! TimeStamp(...)
  let sbegin = ''
  let send = ''
  if a:0 >= 1
  let sbegin = a:1.'\s*'
  if a:1 == '*'
    let sbegin = '\' . sbegin
  endif
  endif
  if a:0 >= 2
  let send = ' '.a:2
  endif
  let pattern = 'Last Change:.*'
    \. send
  let pattern = '^\s*' . sbegin . pattern . '\s*$'
  let now = strftime('%Y年%m月%d日 %H时%M分%S秒',
    \localtime())
  let row = search(pattern, 'n')
  if row != 0
  let curstr = getline(row)
  let col = match( curstr , 'Last')
  let leftcol = match(curstr,sbegin)
  let spacestr = repeat(' ',col - len(a:1)-leftcol)
  let leftspacestr = repeat(' ',leftcol)
  let now = leftspacestr . a:1 . spacestr . 'Last Change: '
    \. now . send
  call setline(row, now)
  endif
endfunction

""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.m,*.f90,*.prolog,*.pl,*.py exec ":call SetTitle()" 
autocmd BufNewFile *.m,*.f90,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
function SetTitle() 
  "如果文件类型为.sh文件 
  if &filetype == 'sh' 
    call setline(1,"\#########################################################################") 
    call append(line("."),   "\#    File Name: ".expand("%")) 
    call append(line(".")+1, "\#       Author: Ye Zhaoliang(yzl)") 
    call append(line(".")+2, "\#        Email: yzhaoliang@outlook.com") 
    call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "\#    CopyRight: ".strftime("%c")." (c) YeZhaoliang") 
    call append(line(".")+5, "\#########################################################################") 
    call append(line(".")+6, "\#!/bin/bash") 
    call append(line(".")+7, "") 
  elseif &filetype == 'perl' 
    call setline(1,"\#########################################################################") 
    call append(line("."),   "\#    File Name: ".expand("%")) 
    call append(line(".")+1, "\#       Author: Ye Zhaoliang(yzl)") 
    call append(line(".")+2, "\#        Email: yzhaoliang@outlook.com") 
    call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
    call append(line(".")+4, "\#    CopyRight: ".strftime("%c")." (c) YeZhaoliang") 
    call append(line(".")+5, "\#########################################################################") 
    call append(line(".")+6, "\#!/usr/bin/perl -w") 
    call append(line(".")+7, "") 

elseif &filetype == 'fortran'
    call setline(1, "!*************************************************************************") 
    call append(line("."),   "!    >    File Name: ".expand("%")) 
    call append(line(".")+1, "!    >       Author: Ye Zhaoliang(yzl)") 
    call append(line(".")+2, "!    >        Email: yzhaoliang@outlook.com") 
    call append(line(".")+3, "!    > Created Time: ".strftime("%c")) 
    call append(line(".")+4, "!    >    CopyRight: ".strftime("%c")." (c) YeZhaoliang") 
    call append(line(".")+5, "! ************************************************************************/") 
    call append(line(".")+6, "!")

elseif &filetype == 'matlab'
    call setline(1, "%*************************************************************************") 
    call append(line("."),   "%    >    File Name: ".expand("%")) 
    call append(line(".")+1, "%    >       Author: Ye Zhaoliang(yzl)") 
    call append(line(".")+2, "%    >        Email: yzhaoliang@outlook.com") 
    call append(line(".")+3, "%    > Created Time: ".strftime("%c")) 
    call append(line(".")+4, "%    >    CopyRight: ".strftime("%c")." (c) YeZhaoliang") 
    call append(line(".")+5, "% ************************************************************************/") 
    call append(line(".")+6, "%")


   else 
    call setline(1, "/*************************************************************************") 
    call append(line("."),   "    >    File Name: ".expand("%")) 
    call append(line(".")+1, "    >       Author: Ye Zhaoliang(yzl)") 
    call append(line(".")+2, "    >        Email: yzhaoliang@outlook.com") 
    call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
    call append(line(".")+4, "    >    CopyRight: ".strftime("%c")." (c) YeZhaoliang") 
    call append(line(".")+5, " ************************************************************************/") 
    call append(line(".")+6, "")
  endif
  if &filetype == 'cpp'
    call append(line(".")+7, "#include<iostream>")
    call append(line(".")+8, "using namespace std;")
    call append(line(".")+9, "")
  endif
  if &filetype == 'c'
    call append(line(".")+7, "#include<stdio.h>")
    call append(line(".")+8, "")
  endif
  "新建文件后，自动定位到文件末尾
  autocmd BufNewFile * normal G
endfunction


""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
let g:LookupFile_TagExpr = '"./filenametags"'
endif
"映射LookupFile为,lk
nmap <silent> <leader>lk :LUTags<cr>
"映射LUBufs为,ll
nmap <silent> <leader>ll :LUBufs<cr>
"映射LUWalk为,lw
nmap <silent> <leader>lw :LUWalk<cr>


"" create tags for lookupfile

"chalk setting
set foldmethod=marker

vmap zf <Plug>Chalk          " Create fold at visual selection
nmap zf <Plug>Chalk          " Create fold at operator movement
nmap zF <Plug>ChalkRange     " Create fold for specified number of lines

nmap Zf <Plug>SingleChalk    " Open single fold at current level
                             " or specified count
nmap ZF <Plug>SingleChalkUp  " Open single fold at next level
                             " or specified count

nmap =z <Plug>ChalkUp        " Increment current fold level
nmap -z <Plug>ChalkDown      " Decrement current fold level
vmap =z <Plug>ChalkUp        " Increment levels in selection
vmap -z <Plug>ChalkDown      " Decrement levels in selection


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Ctrlp
"let g:ctrlp_funky_sh_type = 'bash' "default bash    you can set zsh
let g:ctrlp_funky_multi_buffers = 1
let g:ctrlp_funky_syntax_highlight = 1
"enable cache
let g:ctrlp_funky_use_cache = 1
" CtrlP for NerdTree
let g:ctrlp_funky_nerdtree_include_files = 1 
"ctrl[-func
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>"

"let g:airline_theme='alduin'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
"let g:airline_theme='base16_spacemacs'
"
"
"For your nerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



"java
"autoload java-api-complete
au BufNewFile,BufRead *.java    setl omnifunc=javaapi#complete
"show status refarence
au CompleteDone *.java          call javaapi#showRef()
au BufNewFile,BufRead *.java    inoremap <expr> <c-down> javaapi#nextRef()
au BufNewFile,BufRead *.java    inoremap <expr> <c-up>   javaapi#prevRef()

"balloon help

if has("balloon_eval") && has("balloon_multiline") 
  au BufNewFile,BufRead *.java  setl bexpr=javaapi#balloon()
  au BufNewFile,BufRead *.java  setl ballooneval
endif

"delay load class defines

let g:javaapi#delay_dirs = [
  \ 'java-api-javax',
  \ 'java-api-org',
  \ 'java-api-sun',
  \ 'java-api-servlet2.3',
  \ 'java-api-android',
  \ ]
"
"
set tags+=./tags

"Ctrl-Space
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
"hidden is needed for CtrlSpace
set nocompatible
set hidden
"let g:ctrlspace_default_mapping_key="<leader><F2>"
nnoremap <F2> :CtrlSpace O<CR>
let g:CtrlSpaceHeight=1


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

"easytags   ctags -R ~/.vim
"let g:easytags_file = '~/.vim/tags'

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
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_tree_opened_icon = '▾'
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
let g:unite_source_everything_limit = 100
let g:unite_source_everything_full_path_search = 1
let g:unite_source_everything_posix_regexp_search = 1
let g:unite_source_everything_async_minimum_length = 3
let g:unite_source_everything_cmd_path = 'C:\\Users\\YeZhao\\.vim\\es\\es.exe'



set makeprg=perl\ %<.pl
let g:Perl_Executable='D:\Perl\perl\bin\perl.exe'

"let g:Matlab_GlbTemplateFile='C:/Users/YeZhao/.vim/vim-plugins/matlab-support/templates/Templates'
let g:Matlab_GlbTemplateFile=$HOME.'/vim-plugins/matlab-support/templates/Templates'
let s:Matlab_LclTemplateFile=$HOME.'/vim-plugins/matlab-support/templates/Templates'
let g:Matlab_MlintExecutable = 'D:/Program Files/MATLAB/R2017a/bin/win64/mlint.exe'

let g:Git_Executable = 'D:\Program Files\Git\bin\git.exe'
"let g:Git_Executable = 'gitk'
let g:Git_GitKExecutable = 'D:\Program Files\Git\cmd\gitk.exe'
let g:Git_GitKScript     = 'D:\Program Files\Git\cmd\gitk'
let g:Git_GitBashExecutable= 'D:\Program Files\Git\bin\sh.exe'
let g:Git_Executable = 'git'
"let g:Git_BinPath='D:\Program Files\Git\bin\'



" notebook.vim configuration file
" 
let g:nb_notebook = "hello_world"
let g:nb_categories = ['CHECK', 'CLASS', 'CODE', 'CONDITION', 'DEBUG', 'DEFINE', 'DEFINITION', 'DUMMY', 'ENUM', 'FIX', 'FUNCTION', 'HACK', 'INCLUDE', 'INFORMATION', 'INITIALIZATION', 'INTERESTING', 'LOG', 'LOGGING', 'MEMORY', 'MESSAGE', 'METHOD', 'NONE', 'NOTE', 'STRUCT', 'STUDY', 'TEMPLATE', 'TEST', 'TODO', 'TYPE', 'VARIABLE', 'WORKAROUND']


"" for wiki
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
"" for vim-move
let g:move_key_modifier = 'C'

"" Apprentice
set termguicolors

"for easy align 
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"let g:syntastic_enable_matlab_checker = 0
"quickfix导入本地语言出错
function QfMakeConv()
   let qflist = getqflist()
   for i in qflist
      let i.text = iconv(i.text, "cp936", "utf-8")
   endfor
   call setqflist(qflist)
endfunction

au QuickfixCmdPost make call QfMakeConv()


let g:loaded_syntastic_matlab_mlint_checker=0
"let g:Matlab_MlintExecutable=''


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('pl', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('java', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('wiki', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('f90', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('properties', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('m', 'green', 'none', '#ff00ff', '#151515')

"Autoopen NERDTree on GVim / MacVim startup
"let g:nerdtree_tabs_open_on_console_startup=1
nnoremap g<LocalLeader> :call setline(line('.'),substitute(getline('.'),'\\','\/','g'))<CR>
nnoremap gd<LocalLeader> :call setline(line('.'),substitute(getline('.'),'\\','\\\\','g'))<CR>


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

let g:startify_bookmarks = [ {'c': 'D:\Program Files (x86)\Vim\.vimrc'}, {'m': '~/.vim/myPlugManage.vim'}, 'D:\Todo\todo.txt_cli-2.9\todo.txt','https://github.com/kana/vim-textobj-user/wiki']
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
    \ ]

"" for vim operator-flashy
"map y <Plug>(operator-flashy)
"nmap Y <Plug>(operator-flashy)$


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
nmap <leader>cp :CopyRelativePath<CR>
nmap <leader>cl :CopyRelativePathAndLine<CR>
nmap <leader>cP :CopyAbsolutePath<CR>
nmap <leader>cf :CopyFileName<CR>
nmap <leader>cd :CopyDirectoryPath<CR>

```

[1]:http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/ 
[2]:https://github.com/vim-ctrlspace/vim-ctrlspace 
[3]:https://github.com/vimwiki/vimwiki 
[4]:https://github.com/chip/vim-fat-finger 
[5]:https://github.com/mattn/calendar-vim  
[6]:https://github.com/VundleVim/Vundle.vim 
[7]:https://github.com/junegunn/vim-plug 
[8]:https://github.com/Shougo/vimfiler.vim 
[9]:https://github.com/Shougo 
[10]:https://github.com/junegunn 
[11]:https://github.com/junegunn/vim-easy-align 
[12]:https://github.com/scrooloose/nerdtree 
[13]:https://github.com/majutsushi/tagbar 
[14]:https://github.com/vim-airline/vim-airline 
[15]:https://github.com/airblade/vim-gitgutter 
[16]:https://github.com/terryma/vim-multiple-cursors 
[17]:https://github.com/tpope/vim-surround 
[18]:https://github.com/tpope/vim-repeat 
[19]:https://rhysd.github.io/clever-f.vim/ 
[20]:https://github.com/tpope 
[21]:https://github.com/WolfgangMehner/vim-plugins 
[22]:https://github.com/matze/vim-move 
[23]:/images/AboutVim/tagbar.png 
[24]:/images/Aboutvim/MyBeautifulVim.jpg 
[25]:https://github.com/mhinz/vim-startify 
[26]:https://github.com/junegunn/vim-easy-align/blob/master/EXAMPLES.md#formatting-yaml-or-json 
[27]:https://github.com/easymotion/vim-easymotion 
[28]:https://github.com/ruanyl/bigvim 
[29]:https://github.com/haya14busa/incsearch.vim 
[30]:https://github.com/haya14busa 
[31]:https://github.com/itchyny/vim-cursorword 
[32]:https://github.com/AndrewRadev/splitjoin.vim 
[33]:https://github.com/AdamWhittingham/vim-copy-filename 
[34]:https://github.com/ggreer/the_silver_searcher 
