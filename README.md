![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

    vim有一点不能忘，模式化无鼠标编辑, 禅定!
    分层配置，层层玻璃纸化，系统有机构成，打造适合writer的乐园
    牢记利器是来解决问题，干有挑战事情的，做有意义工作
    
    3个特色(足矣)：
    
    - Leaderf + Vimmark
    - g* z* + vimmark
    - ctrl +] 跳转到定义  Ctrl+o跳转回去

  gvim_8.2.3154_x64.exe match  python-3.9.6-amd64(python3.8.2 cannot work , you need to download older gvim version!)
  
  2021-07-13 updated gvim_8.2.3154(with vim9 support)+python3.9.6
  
<hr/>

## funny 

`:GitBlame` 可以查看当前文件的所有更改过程

1. (Deprecated)下载，不破坏原始架构
   引入leaderf后，需要满足两个条件 带python的vim安装包，python的详细版本信息请查看[ vim windows版本下载链接 ][12]

2. 写了my_configs.vim  并下载了自己插件到my_plugins文件夹
3. rainbow_paratheses的好处是让括号好看些
4. (deprecated)更快的ctrlp配置`F2`,`F1`和`,o`的bufferexplorer命令一样, 加入了第三方matcher 命中插件[ctrlp-py-matcher][6]
   并替换掉ctrlp默认的搜索为ag搜索  ctrlp_user_command. CtrlPMRU 和CtrlPMRUFiles的区别是，后面一个除了搜索MRU还
   包括文件的搜索
   `C-o` 打开一个提示框，一般我选择t,在新窗口中打开文件。

   此条内容已被leaderf替代!

5. 增加了nerdcomment方便注释`(,cc)`, 替换掉vim-commentary

- `,cc`

6. Comfortable-motion也是挺有用的`<C-f><C-d><C-u><C-b>`

- `<C-e>` 向下慢移动
- `<C-d>` 向下快移动
- `<C-u>` 向上移动

7. 增加我的`,a 搜索光标下单词 和<space>/打开Ag` (在config-ctrlp.vim中配置了),`,cad`调用calendar,然后写wiki,`,wi`写日记也是可以的,`[[#]]`在#之后可以使用`Ctrl-X Ctrl-o`会弹出一个列表
    不忍放弃vim的一个原因，很方便; 摁下`+`表示增加header，`-`表示较少header
    [[向前跳 ]]向后跳   [u upper parent node

- `,a` 搜索， 可以配合`,fr`, 使用leaderf rg进行异步搜索
- `,cal` 打开日历窗口
- `,wi` 打开diary文件
- `[[` wiki文件内向前一header跳转(只要是header即可，不考虑是否同级)
- `]]` wiki文件内向后一header跳转(只要是header即可，不考虑是否同级)
- `[=` wiki文件内同级向前跳转(有用)
- `]=` wiki文件内同级向后跳转(有用)
- `[u` wiki文件内向父级跳转, 如果有父节点(有用)
- `]u` wiki文件内向子级跳转,如果有子节点(有用)

8. `C:\Users\yzl`的.NERDTreeBookmarks nerdtree的`:Bookmark`对应的文件夹名名字,`_vim_mru_files`保存着最近访问的文件,`_vimtags`保存着所有tag相关的记录.

增删部分:

- `:Bookmark` 添加当前项目文件夹进入Nerdtree中
- `B` 在nerdtree框中可以toggle bookmark中的文件，也可以通过`let NERDTreeShowBookmarks=1 `,默认打开bookmark
- `F` 是否显示文件(有时候只关注目录)
- `l` toggle隐藏文件
- `D` 删除当前书签
- m 显示nerdtree的一般操作命令
    - p拷贝当前的文件名路径
    - a添加节点
    - d删除节点
    - m移动节点
    - c拷贝节点
    - o有趣的命令，使用系统打开工具

导航部分:

- `P` 调到根节点
- `p` 小写p跳到父节点
- `K` 跳到当前目录下同级的第一个结点
- `J` 跳到当前目录下同级的最后一个结点
- `k` 跳到当前目录下同级的前一个结点(类似vimwiki的`[=`)
- `j` 跳到当前目录下同级的后一个结点(类似vimwiki的`]=`)
- `C` 将选中目录或选中文件的父目录设为根结点(有时候很方便 可以简化视角区域)-->`u`反向(大小的C)
- `u` 将当前根结点的父目录设为根目录，并变成合拢原根结点(move tree root up a dir)
- `U` 将当前根结点的父目录设为根目录，但保持展开原根结点(move tree root up a dir, but leave old root open)
- ctrl+T 往后一个tab
- ind+Ctrlo 3gt

- `cd` change the CWD to the selected dir
- 注意是大写的CD,而不是小写的,首先是:cd到某个目录下，可以通过:pwd查看，然后切换nerdtre目录下，执行大写CD
- 当你的光标在nerdtree某个文件夹下，可以执行cd，然后pwd就会变换到对应的目录，用一次CD那么根目录就变成pwd目录了(用以折叠目录，聚焦查看文件夹 很方便!)。 然后使用u可以将父节点社会根节点（并且不展开） 使用大写P直接调到当前的根节点（也就是当你大写CD一次之后，你的根节点变化，u或者U一次，你的根节点发生变）化
- 典型的二叉树风格！树形节点查看文件，不错的代码阅读神器

9. (Deprecated)`C-s`变成加入光标, `Alt-S`变成添加符合全部单词下的光标,`ESC`推出MC(multiple cursors)模式
[[#pringout]]

- `C-s` 换为`:leaderf rg搜索本buffer命令`

10. `gf` open file under cursor,如果是路径的话(配合上vimwiki).
11. easymotion的<leader>j和k可以正常于运行
12. (Deprecated) 添加了TODO,FIXME等关键字的高亮，`F7` 添加TODO(yzl),`,g`调用`:ACK` 然后写上TODO就可以过滤项目中所有具有TODO字段的行了(习惯性地添加TODO,FIXME,BUG等) [TODO高亮](https://www.jb51.net/article/115922.htm)

    F7功能已被leaderf替换掉！

13. `,fu`查看当前代码文件的所有函数(似乎有点用)  `,fU`跳转到指定函数中， 依然保留ctrlp-funky功能

- `,fu`
- `,fU`

14.  `F8`添加so what 总结性声明.

- `F8`

15. 编写perl文件常用命令，读取文件`\ii`,输出文件`\io`,while循环`\sw`,for循环`\sfe`, 另外你不能忘记的三个数据结构,标量`\id`,数组`\ia`,字典`\ih`

- `\ii` 读取
- `\io` 输出
- `\sw` while
- `\sfe` for
- `\id` 标量
- `\ia` 数组
- `\ih` 字典

16. Interesting,不妨试试! `,z`打开goyo界面，很好看

- `,z`

17. 先设置一个mark`mA`,然后由于大写字母支持文件间跳转，于是`~A`也是可以跳转到先前的位置 很方便

- `m[A-Z]`
- `~[A-Z]`

18. 修改了vimwiki配置到vim_runtime.  Ctrl+enter 垂直打开链接， shift+enter 水平打开链接, enter直接在当前窗口打开
    CTRL+Shift+@表示把list加上checkbox(gl-space或者glx表示取消掉checkbox，gln glp显示不同的任务状态)
    速度得快点摁下 gLa gLA gLi gL+ gL*

    - vikwikiTable cols rows(列行控制)  C-J/C-K上下行调换
    - Alt+left /right 左右列调换
    - viH/aH 选择一个header内的所有内容(配合上cih就可以修改一个标题内的所有内容了)
    - vi\/a\ 选择一个table里面的内容
    - vic/ac 选择一列内容(配合上cic 就很方便咯)
    - vil/val 列表内容的一项和所有项

19. 搞清楚[ vim-snipmate ][3]和[ vim-snippets ][2]的关系
不断去学习[ vim-snippets ][2], [vim-snipmate设计理念][4]
20. vim-mark 让你看代码更方便,  自写函数`,*`表示选择一行高亮

- `,r` 有效
- `,j` 向上标记行 2021-05-05 
- `,k` 向下标记行

21. [GlobalVim][5] 全局vim功能，事先设置好GK键即可，设置为CapsLock key ,win10-->设置-->讲述人--->更改光标粗细，这样看起来会更好些
效率是一方面，有趣是最要的!(Solve your work, keep your life interesting)
22. 我居然忘记怎么调用vim-surround, view模式下，大写S然后输入你的左边delimeter, 可以快速删除`ds"`,快速修改`cs"`,快速复制`ys''`

- `ds"`
- `cs"`
- `ys"`

23. csv文件，可以使用`Ctrl_V`批量幅值一列，然后使用vimfiler在不同文件夹中跳转，也可以复制宏，把刚才定位，选择一列，复制集合到一个宏命令，
这样就可以减少你办公室后的噪音(无噪音式办公模式)

24. 增加了[ leaderf ][7] 替换掉ctrlp, 需要vim+python3, windows下支持python的vim工具[ 下载地址 ][8], 注意一定得支持python功能的vim，否则无法使用leaderf
[ vim中如何使用python工具说明 ][9]， 记住必须知道支持编译vim的工具中使用的python和你的系统中安装的是同一版本，比如3.8.2python 64bit!
保证一样即可使用。

到此为止，本项目需要满足两个条件:

1. 支持python功能的vim安装包
2. vim安装包内对应的python版本，现在vim，然后`:version`查看一下python版本
常用命令： `Leaderf file --popup   leaderf buffer --popup  Leaderf function --popup   leaderf rg`

- `C-S`: buffer内查找内容 , `,fb  2021-05-05 `
- `C-F`: 查找文件, `,ff`
- `F1`: MRU files, `,fm`
- `F2`: file间查找内容, 如果是一长串单词，得用双引号
- `F7`: 查找当前buffer的函数(意义不大), 有点作用. 


25. very good! 效果很好
`C-f` 弹出一个搜索框 , 然后`C-J`or `C-K` 向下或者向上查找文件亦或者具体输入字母， 

- `C-]` 直接右边打开(垂直打开)
- `C-X` 直接水平划分窗口
- `C-T` 新的tab窗口打开, good
- `C-U` 可以清除输入区
- `UP`向上翻历史
- `down`向下翻历史
- `C-P` 哈哈，居然有preview功能!!!功能

26. [ leaderf-marks ][10] 用于搜索vim marks功能， 对应

- `<F9>`,
- `,fn`
- `<F1>` 调用`leaderf-mru`
- <F2>调用,windows使用`C-s`

27.  [ 自动切换当前的buffer文件所在目录为工作目录 ][11], `set autochdir`

28. `,td`关闭当前标签替换掉`:wq`, `,tn` `,tp`前后标签切换。

- `,td`
- `,tn`
- `,tp`

29. `:Leaderf buffer`对应

- `<F10>` 
- `,b`, good!
- `,fb`

30. vim-mark 很方便，查看文件可以标记文字， 感觉比[ symbol-overlay ][13]还好用(在非代码文件中)

- `,m` 标记选择区域一种颜色
- `,r` 输入一段regex或者字符进行着色！
- `,#` 向上查看标记区域(按的速度得快点)
-  `,*` 向下查看标记区域

31. vim-asterisk在同一个buffer内查找也挺方便的，配合上`<C-S>`对应的`Leaderf buffer`以及`,l`对应的`unite line`使得单个文件查找很方便

-  `*` `g*` `z*` 向下查找当前cursor下的单词(查找词会处于高亮形式)-----已经成为少不了的工具，再配合上`,m` vim mark一下，perfect！
- 2020-10-06 有用 leaderf buffer配合vim mark也是不错的！
    - `n` 向下查
    - `N` 向上查
    - 优化流程:
        - `,m`着色
        - `*` 对着色内容逐个跳转(可进行对修改， 如果相同步所有，直接`n`,然后`.`即可重复上一次命令)
-  `#` `g#` 向上查找当前cursor下的单词(`z#`不给力)
- `z/` `z?` `zg/` 都可以输入查找 很方便

32. [ vim-surround ][15]在vim中可以使用`:echo char2nr('-')` 会返回45，表示`-`的ASCII是45
可以查看[ ASCII码表 ][14]进行其他关键字符的定义

通过下面的配置，就可以在vimwiki文件中使用可视模式选择多行+`S-`来完成多个字符的输入。

``` vim 

"Code block for markdown
autocmd FileType vimwiki let b:surround_45 = "{{{java \n\r\n}}}"

"Code block for markdown
 autocmd FileType markdown let b:surround_45 = "```\n\r\n```"

"Block comment for python
 autocmd FileType python let b:surround_45 = "\"\"\"\n\r\n\"\"\""

```

latex部分，可以通过添加额外的输入，很方便， 其中

- `\\begin`表示`\begin`, `\`需要进行转义,有特殊含义
- `\1\1`两个slash1对代表要输入额外的提示词, 最多可以达到`\7\7`,在`\1`之前还可以插入提示信息，比如environment: 
   就会在minibuffer中显示出来。
- `{ }` 不需要进行转移
- `108` 则代表的`\`所代表的的ASCII码， `:echo char2nr('\')`

```vim

" vertical |
autocmd FileType vimwiki let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\1}"
```

33. [ vifm ][16]是类似于[ leaderf ][7]、[ unite.vim ][17]、[ nnn.vim ][18]的文件浏览器

unite常用命令，因为安装了[Shougo/neomru.vim][19],所以可以使用`:Unite mru`


- `,f` 打开文件目录
- `,l` 进行文件内搜索(), 类似与`z?`，但是`z?`有个好处可以显示当前是第几个匹配位置,不同于`z/`,`zg/`,因为后两者是类似于easymotion的功能，可以快速字符定位； `g*`,`g#`,`z*` , 
- `:unite mru`  or `:unite neo/`


34. 打开所有当前配置的快捷键

- `:Map` or `:Maps` 可输入查找的形式 推荐！
- `:map`  阅读模式

35. vim方式的快速定位easymotion

- `z?`,`z/` 的incsearch+easymotion的组合体模糊搜索
- `,w`,`,W` 向下查找 forward 跳转到档次前方
- `,B` backward跳转到当前前方
- `,j` 向下定位行数 line forward
- `,k` 向上定位行数 line downword
- `,s`,`,T`,`,t` 查找一个字母
- `,n`  jump to latest 查找的单词, 类似[ cleverf ][21] 的`f`
- `,N`  反向jump to latest 查找的单词， 类似[ cleverf ][21]的`F`


36.  fzf
[vim-fzf][23] 是一个快速编辑的工具， 见配置文件config-fzf 

可以快速插入行和文件路径

Linux底下使用该功能就是核弹级的功能
```

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-j> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

```

37. vim perl
[ 好的代码风格决定你产生更好的bug ][24]
- `\rr` 运行脚本， 不用在使用`:perl %`了
- `\rs` 检查语法
- `\cy` 执行perltity , 前提得安装`PERL::TITY`
- `\ci` 展示已经安装的perl模块
- `\rk` 检查一下你的设置是否安装了`PERL::TITY` 和 `PERL::CRITIC`


![Vim-features][1]

38. vim multiple-cursor(多重选择)

- 选择一个单词或者一个单元，`ctrl-n`会选择相同的regexp，选好后执行vim相关编辑命令即可，比如删除，添加
- `ctrl-v` [不断往下走，添加行cursors，执行相关操作](不断往下走，添加行cursors，执行相关操作), ESC两下即可全部执行大写I和大写A或者大写D

40. 多个vimwiki配置

``` vim

let g:vimwiki_list = [{ 'path': '~/.vim_runtime/vimwiki/', 'path_html': '~/.vim_runtime/vimwiki_html','auto_toc': 1, 'syntax':'default'}, { 'path': '~/.vim_runtime/vimwikiTODO/', 'path_html': '~/.vim_runtime/vimwikiTODOHTML','auto_toc': 1, 'syntax':'default'}, { 'path': '~/.vim_runtime/vimwikiOffshore/', 'path_html': '~/.vim_runtime/vimwikiOffshoreHTML','auto_toc': 1, 'syntax':'default'}]
```
如何切换vimwiki? 
`<leader> ws`, 执行vimwikiUISelect命令，通过`:Maps`,默认调用fzf配置，可以查看`config-fzf.vim`,可以查看所有的map视图
    <2022-06-21 19:15>


<hr/>
# The Ultimate vimrc

Over the last 10 years, I have used and tweaked Vim. This configuration is the ultimate vimrc (or at least my version of it).

There are two versions:

* **The Basic**: If you want something small just copy [basic.vim](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) into your ~/.vimrc and you will have a good basic setup
* **The Awesome**: Includes a ton of useful plugins, color schemes, and configurations

I would, of course, recommend using the awesome version.


## How to install the Awesome version?
### Install for your own user only
The awesome version includes a lot of great plugins, configurations and color schemes that make Vim a lot better. To install it simply do following from your terminal:

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	
### Install for multiple users
To install for multiple users, the repository needs to be cloned to a location accessible for all the intended users.

	git clone --depth=1 https://github.com/amix/vimrc.git /opt/vim_runtime
	sh ~/.vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime user0 user1 user2
	# to install for all users with home directories
	sh ~/.vim_runtime/install_awesome_parameterized.sh /opt/vim_runtime --all
	
Naturally, `/opt/vim_runtime` can be any directory, as long as all the users specified have read access.

## Fonts

I recommend using [IBM Plex Mono font](https://github.com/IBM/plex) (it's an open-source and awesome font that can make your code beautiful). The Awesome vimrc is already setup to try to use it.

Some other fonts that Awesome will try to use:

* [Hack](http://sourcefoundry.org/hack/)
* [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/)

## How to install the Basic version?

The basic version is just one file and no plugins. Just copy [basic.vim](https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim) and paste it into your vimrc.

The basic version is useful to install on remote servers where you don't need many plugins, and you don't do many edits.

	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh


## How to install on Windows?

Use [gitforwindows](http://gitforwindows.org/) to checkout the repository and run the installation instructions above. No special instructions needed ;-)


## How to install on Linux

If you have vim aliased as `vi` instead of `vim`, make sure to either alias it: `alias vi=vim`. Otherwise, `apt-get install vim`


## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git pull --rebase


## Some screenshots

Colors when editing a Python file:

![Screenshot 1](https://dnp4pehkvoo6n.cloudfront.net/07583008e4da885801657e8781777844/as/Python%20editing.png)

Opening recently opened files with the [mru.vim](https://github.com/vim-scripts/mru.vim) plugin:

![Screenshot 2](https://dnp4pehkvoo6n.cloudfront.net/1d49a88f9bd5d013c025bb1e1272a7d8/as/MRU%20plugin.png)

[NERD Tree](https://github.com/scrooloose/nerdtree) plugin in a terminal window:
![Screenshot 3](https://dnp4pehkvoo6n.cloudfront.net/ae719203166585d64728f28398f4b1b7/as/Terminal%20usage.png)

Distraction free mode using [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2):
![Screenshot 4](https://dnp4pehkvoo6n.cloudfront.net/f0dcc4c9739148c56cbf8285a910ac41/as/Zen%20mode.png)


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [bufexplorer.zip](https://github.com/vim-scripts/bufexplorer.zip): Quickly and easily switch between buffers. This plugin can be opened with `<leader+o>`
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`, 修正ctrl+F，和comfortable-motion重合
* [goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2): 
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [NERD Tree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [mru.vim](https://github.com/vim-scripts/mru.vim): Plugin to manage Most Recently Used (MRU) files. This plugin can be opened with `<leader+f>` 删掉他，ctrlp已经集成了MRU功能，多余
* [open_file_under_cursor.vim](https://github.com/amix/open_file_under_cursor.vim): Open file under cursor when pressing `gf`
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your vim runtimepath 
* [snipmate.vim](https://github.com/garbas/vim-snipmate): snipmate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim,vim-snipmate default [snippets][2] (Previously snipmate-snippets) 
    也就是说vim-snipmate读取vim-snippets项目的snippets.
* [ale](https://github.com/w0rp/ale): Syntax and lint checking for vim (async)
* [vim-commentary](https://github.com/tpope/vim-commentary): Comment stuff out.  Use `gcc` to comment out a line (takes a count), `gc` to comment out the target of a motion. `gcu` uncomments a set of adjacent commented lines.(使用nerdcommenter替换他!!!!!)
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object representing lines of code at the same indent level. Useful for python/vim scripts
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim, CTRL+N is remapped to CTRL+S (due to YankRing)
* [vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack): Maintains a history of previous yanks, changes and deletes
* [vim-zenroom2](https://github.com/amix/vim-zenroom2) Remove all clutter and focus only on the essential. Similar to iA Writer or Write Room


## Included color schemes

* [peaksea](https://github.com/vim-scripts/peaksea): The default
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-irblack](https://github.com/wgibbs/vim-irblack)
* [mayansmoke](https://github.com/vim-scripts/mayansmoke)
* [vim-pyte](https://github.com/therubymug/vim-pyte)


## Included modes

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-less](https://github.com/groenewege/vim-less)
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako)
* [vim-markdown](https://github.com/tpope/vim-markdown)
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [vim-go](https://github.com/fatih/vim-go)


## How to include your own stuff?

After you have installed the setup, you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you. For instance, my **my_configs.vim** looks like this:

	~/.vim_runtime (master)> cat my_configs.vim
	map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
	map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr> 

You can also install your plugins, for instance, via pathogen you can install [vim-rails](https://github.com/tpope/vim-rails):

	cd ~/.vim_runtime
	git clone git://github.com/tpope/vim-rails.git my_plugins/vim-rails


## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.


### Plugin related mappings

Open [bufexplorer](https://github.com/vim-scripts/bufexplorer.zip) to see and manage the current buffers (`<leader>o`):
    
    map <leader>o :BufExplorer<cr>

Open [MRU.vim](https://github.com/vim-scripts/mru.vim) to see the recently open files (`<leader>f`):

    map <leader>f :MRU<CR>

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<leader>j` or `<ctrl>f`):
    
    let g:ctrlp_map = '<c-f>'

[NERD Tree](https://github.com/scrooloose/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) and [vim-zenroom2](https://github.com/amix/vim-zenroom2) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It has a special look when editing Markdown, reStructuredText and textfiles. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>


### Normal mode mappings

Fast saving of a buffer (`<leader>w`):

	nmap <leader>w :w!<cr>
	
Map `<Space>` to `/` (search) and `<Ctrl>+<Space>` to `?` (backwards search):
	
	map <space> /
	map <c-space> ?
	map <silent> <leader><cr> :noh<cr>

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>to :tabonly<cr>
	map <leader>tc :tabclose<cr>
	map <leader>tm :tabmove 
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Quickly open a buffer for scripbble:
	
	map <leader>q :e ~/buffer<cr>

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press gv you `Ack.vim` after the selected text:

	vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

Surround the visual selection in parenthesis/brackets/etc.:

    vnoremap $1 <esc>`>a)<esc>`<i(<esc>
    vnoremap $2 <esc>`>a]<esc>`<i[<esc>
    vnoremap $3 <esc>`>a}<esc>`<i{<esc>
    vnoremap $$ <esc>`>a"<esc>`<i"<esc>
    vnoremap $q <esc>`>a'<esc>`<i'<esc>
    vnoremap $e <esc>`>a"<esc>`<i"<esc>


### Insert mode mappings

Quickly insert parenthesis/brackets/etc.:

    inoremap $1 ()<esc>i
    inoremap $2 []<esc>i
    inoremap $3 {}<esc>i
    inoremap $4 {<esc>o}<esc>O
    inoremap $q ''<esc>i
    inoremap $e ""<esc>i
    inoremap $t <><esc>i

Insert the current date and time (useful for timestamps):

    iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


### Command line mappings

$q is super useful when browsing on the command line. It deletes everything until the last slash:

    cno $q <C-\>eDeleteTillSlash()<cr>

Bash like keys for the command line:

    cnoremap <C-A>		<Home>
    cnoremap <C-E>		<End>
    cnoremap <C-K>		<C-U>

    cnoremap <C-P> <Up>
    cnoremap <C-N> <Down>

Write the file as sudo (works only on Unix). Super useful when you open a file and you don't have permissions to save your changes. [Vim tip](http://vim.wikia.com/wiki/Su-write):

    :W 


### Spell checking
Pressing `<leader>ss` will toggle spell checking:

    map <leader>ss :setlocal spell!<cr>

Shortcuts using `<leader>` instead of special characters:

    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`

[1]: https://github.com/jueqingsizhe66/windowVimFaster/tree/develop/img/vimFeatures.png
[2]:https://github.com/honza/vim-snippets 
[3]:https://github.com/garbas/vim-snipmate 
[4]:http://vim-wiki.mawercer.de/wiki/topic/text-snippets-skeletons-templates.html 
[5]:https://ovo.ltd/projects/globalvim/ 
[6]:https://github.com/FelikZ/ctrlp-py-matcher/issues/41 
[7]:https://github.com/Yggdroot/LeaderF 
[8]:https://github.com/vim/vim-win32-installer/releases 
[9]:https://www.v2ex.com/t/410079 
[10]:https://github.com/Yggdroot/LeaderF-marks 
[11]:https://my.oschina.net/uniquejava/blog/225027 
[12]:https://github.com/vim/vim-win32-installer/blob/master/README.md 
[13]:https://emacs-china.org/t/package-symbol-overlay-symbol 
[14]:https://baike.baidu.com/item/ASCII/309296?fromtitle=ascii%E7%A0%81&fromid=99077&fr=aladdin 
[15]:https://github.com/tpope/vim-surround/ 
[16]:https://github.com/vifm/vifm.vim 
[17]:https://github.com/Shougo/unite.vim 
[18]:https://github.com/mcchrish/nnn.vim 
[19]:https://github.com/Shougo/neomru.vim/ 
[20]:https://github.com/easymotion/vim-easymotion 
[21]:https://github.com/rhysd/clever-f.vim 
[22]:https://www.youtube.com/watch?v=qgG5Jhi_Els 
[23]:https://github.com/junegunn/fzf#windows 
[24]:https://perlmaven.com/how-to-improve-my-perl-program 
