" SET {{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"设置和 vi 兼容
set nocp
set nocompatible

"设置行号
set number
"设置相对行号
"set relativenumber

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"打开状态栏标尺
set ruler

" 背景亮度
set bg=dark " light


"设置 \t 转换为空格
set expandtab
"设置制表符宽度为4
"set tabstop=4
"设置缩进的空格数为4
set shiftwidth=4
set softtabstop=5

"设置和上一行一样缩进
set autoindent
"设置使用C/C++ 缩进
set cindent        
" 设置缩进模式
"set   cinoptions=:0
"探测文件类型
"设置不同的 缩进,默认配置 在/usr/share/vim/vim74/indent
"设置不同的 高亮
"设置不同的插件
filetype plugin indent on

"80字符
set colorcolumn=81
"设置81行的颜色
"hi ColorColumn ctermbg=lightgrey guibg=lightgrey
"自动换行,仅在纯文本中才换行
autocmd FileType text setlocal textwidth=80
"添加中文字符检测
set fo+=mB

"关闭自动换行
"set nowrap
"nnoremap <F4> :set wrap!<CR>

"搜索忽略大小写 ignorecase
"set ic "完全忽略大小写"
set ignorecase smartcase "根据输入,如果是小写,忽略大小写,如果有大写,则不忽略大小写"
"搜索高亮显示
set hlsearch
"未输入完成就开始检索
set incsearch
"set is 


"关键字上色
syntax on


"文件编码格式 从 utf-8 一次检测 ,若再有乱码问题,可以考虑插件 fencview.vim
set fileencodings=utf-8,chinese,latin-1

"终端编码格式
set   termencoding=utf-8

"高亮当前行
set cursorline


"智能补全命令行
set wildmenu

"匹配下拉菜单
set completeopt=longest,menu 

"不使用代码折叠功能
"set nofoldenable
"使用代码折叠
set foldenable
"折叠方法 6中  
"方法    关键字
"marker  Line {\{\{\1
set foldmethod=marker
"怎么切换折叠 za


"configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=./tags

if 0
    if has("vms") "因为在 vms 系统中 会自动创建备份
        set nobackup                       
    else
        set backup
    endif
endif

set nobackup                       
"表示不创建临时交换文件
"set noswapfile

"表示使用系统的粘贴板上的代码粘贴,但不适用 terminal-style 的 终端(X windows)
set clipboard+=unnamed

"打开vim支持256色
set t_Co=256 "在 文字界面下意识不到系统支持256色,需要手动设置,在图形界面下默认为 256
"主题设置为沙漠 在 /usr/share/vim/vim73/colors/ 中
colorscheme desert

"退格键使能(在 insert 模式下 C+h 不管用)
set backspace=indent,eol,start

"设置文件格式
set  fileformat=unix


"光标上下移动时, 移动方向 残留 10行 时开始卷动
set scrolloff=10

"光标左右移动时, 移动方向 残留 10行 时开始卷动
set sidescroll=10

"状态栏显示当前显示的命令
set showcmd

"自动折返 ,这个被覆盖了,后面重写一次就好了
set whichwrap=b,s,<,>,[,] 

"模式匹配要写入的文件名，不建立它的备份文件
set wildignore=*.bak,*.o,*.e,*~

" 命令模式下 tab键 匹配
set wildmenu
"配置规则
"set wildmode=longest,list,full

"历史记录大小

set history=1000

" 不显示 tab 和 回车 
set nolist 

"对于vim 来说什么是一个单词 ,需要重写
"set iskeyword=@,48-57,_,192-255
"set iskeyword+=-

"命令行模式的高度
set cmdheight=2

" 显示 tab 和 回车  tab 为 ^I  回车 为 $
"set list
"set listchars=tab:>-,trail:-
" MAP {{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"因为插件的原因,需要多插入一个 <del>
map \p i(<del><Esc>ea)<Esc>


"小写转大写 wb 为 到 单词 的开始
nnoremap gu  wbgUw
"大写转小写
nnoremap gl wbguw

"行首
noremap H ^i
"行尾
noremap L $a

"mapleader 名字空间
let mapleader=";"
"按下 ;j 触发 easymotion 的 j
"map <Leader>j <Plug>(easymotion-j)
"按下 ;k 触发 easymotion 的 k
"map <Leader>k <Plug>(easymotion-k)

"强制保存命令
cmap sw w !sudo tee >/dev/null %

"空格映射冒号
nnoremap <space> :
vnoremap <space> :

if 1
    "映射光标在 vsplit 窗口间移动的快捷键

    nnoremap <C-h> <C-W>h
    nnoremap <C-j> <C-W>j
    nnoremap <C-k> <C-W>k
    nnoremap <C-l> <C-W>l
    "下面的这条有问题 会把 insert 模式下的 backspace 搞丢
    "inoremap <C-h> <Esc><C-W>h
    inoremap <C-j> <Esc><C-W>j
    inoremap <C-k> <Esc><C-W>k
    inoremap <C-l> <Esc><C-W>l
endif

" Fn 的映射  

nnoremap <F4> :!ctags -R.<CR>

function! Build()
    make
    cl  "list the errors
endfunction 
map <F5> :call Build()<CR>


" Vundle Plugin {{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 插件配置 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 0 Config0 Vundle  插件管理

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" 让vundle管理Vundle,必须


" 0 Plugin0 Vundle  插件管理
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" 请将安装插件的命令放在vundle#begin和vundle#end之间.
" Github上的插件
" 格式为 Plugin '用户名/插件仓库名'

"Plugin 'tpope/vim-fugitive'
" 来自 http://vim-scripts.org/vim/scripts.html 的插件
" Plugin '插件名称' 实际上是 Plugin 'vim-scripts/插件仓库名' 只是此处的用户名可以省略

"Plugin 'L9'
" 由Git支持但不再github上的插件仓库 Plugin 'git clone 后面的地址'

"Plugin 'git://git.wincent.com/command-t.git'
" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'

"Plugin 'file:///home/gmarik/path/to/plugin'
" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下

"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突

"Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前

"--------------------------------------------------------------------
"--------------------------------------------------------------------
"--------------------------------------------------------------------
"--------------------------------------------------------------------

" 1 Plugin1 vim-airline 状态栏
Plugin 'vim-airline/vim-airline' "状态栏内容
Plugin 'vim-airline/vim-airline-themes' "状态栏主题


" 2 Plugin2 ultisnips 自动扩展 及分片
Plugin 'SirVer/ultisnips' " snip 引擎
Plugin 'honza/vim-snippets' "常用的 snippet 

" 3 Plugin3 neocomplete.vim 候选列表
Plugin 'Shougo/neocomplete.vim' 

" 4 Plugin4 auto-pairs 括号数目匹配
Plugin 'jiangmiao/auto-pairs'

" 5 Plugin5 rainbow_parentheses.vim 括号颜色匹配
Plugin 'kien/rainbow_parentheses.vim'

" 6 Plugin6 vim-multiple-cursors 多行编辑
Plugin 'terryma/vim-multiple-cursors'

" 7 Plugin7 vim-easymotion 快速移动
Plugin 'easymotion/vim-easymotion'

" 8 Plugin8 nerdtree 项目树
Plugin 'scrooloose/nerdtree'

" 9 Plugin9 ctrlp.vim 文件管理
Plugin 'kien/ctrlp.vim'

" A PluginA tagbar 函数列表
Plugin 'majutsushi/tagbar'


" B Plugin3 nerdcommenter 快速注释
Plugin 'scrooloose/nerdcommenter'

" C PluginC DoxygenToolkit.vim 注释文档
Plugin 'vim-scripts/DoxygenToolkit.vim'

" D PluginD supertab 解决 neocomplete.vim 和 ultisnips 的兼容问题
Plugin 'ervandew/supertab'

" E PluginE csapprox 解决 文字终端和 图形终端色彩不同的问题 
Plugin 'godlygeek/csapprox'

" F PluginF VisIncr  增强纵向编辑
Plugin 'vim-scripts/VisIncr'



"--------------------------------------------------------------------
"--------------------------------------------------------------------
"--------------------------------------------------------------------
"--------------------------------------------------------------------

"添加完之后,关闭vim,重新打开vim ,然后 :PluginInstall
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"                   - 删除插件，把安装插件对应行删除，然后执行这个命令即可 ,这个是删除 列表中没有的插件
"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后


" Plugin Config {{{1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 管理的插件配置 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 1 Config1 vim-airline-themes 状态栏
let g:airline_theme='simple' "更改主题,主题位置在 ~/.vim/bundle/vim-airline-themes/autoload/airline/themes


" 2 Config2 ultisnips 自动扩展
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>" " 更改展开键为
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" 3 Config3 neocomplete 候选列表
let g:neocomplete#enable_at_startup = 1



" 5 Config5 rainbow_parentheses.vim 括号颜色匹配
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
            \]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" 6 Config6 vim-multiple-cursors 多行编辑
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"useage:
"ctrl+n 选中一个
"ctrl+p 放弃一个, 回到上一个
"ctrl+x 跳过当前选中, 选中下一个
"esc    退出

" 7 Config7 vim-easymotion 快速移动

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" " `s{char}{lael}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"


" 8 Config8 nerdtree 项目树
nmap <F3> :NERDTreeToggle<cr>
"如果只剩下打开的窗口是NERDTree，怎么关闭vim？
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" 9 Config9 ctrlp.vim 文件管理
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_user_command = ['.hg', 'hg --cwd %s locate -I .']

let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'find %s -type f'
            \ }

"useage : :help ctrlp-options

" A ConfigA tagbar 函数列表
nmap <F2> :TagbarToggle <CR>


" B Config3 nerdcommenter 快速注释

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/'  }  }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" C ConfigC DoxygenToolkit.vim 注释文档

let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Sues"
let g:DoxygenToolkit_licenseTag="My own license"  

" useage DoxLic DoxAuthor Dox





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  自己安装的插件配置 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"最好不要自己安装,最好让 Vendle 管理


" AUTOCMD {{{1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" else 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"保留vim 上次编辑位置,下次从这里打开
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   

" 解决 YCM 和  Ultisnips tab 键 冲突 


" TITLE {{{1

""""""""""""""""""""""""""""""""""""""""""
" title 区  
""""""""""""""""""""""""""""""""""""""""""


"新建.c,.h,.sh,.java文件，自动插入文件头 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 

""定义函数SetTitle，自动插入文件头 

func SetTitle() 

    "如果文件类型为.sh文件 

    if &filetype == 'sh' 

        call setline(1,"\#########################################################################") 

        call append(line("."), "\# File Name: ".expand("%")) 

        call append(line(".")+1, "\# Author: Sues") 

        call append(line(".")+2, "\# mail: sumory.kaka@foxmail.com") 

        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 

        call append(line(".")+4, "\# Version : 1.0") 

        call append(line(".")+5, "\#########################################################################") 

        call append(line(".")+6, "\#!/bin/bash") 

        call append(line(".")+7, "") 

    else 

        call setline(1, "/*************************************************************************") 

        call append(line("."), "    > File Name: ".expand("%")) 

        call append(line(".")+1, "    > Author: Sues") 

        call append(line(".")+2, "    > Mail: sumory.kaka@foxmail.com ") 

        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 

        call append(line(".")+4, " ************************************************************************/") 

        call append(line(".")+5, "")

    endif

    if &filetype == 'cpp'

        call append(line(".")+6, "#include<iostream>")

        call append(line(".")+7, "using namespace std;")

        call append(line(".")+8, "")

    endif

    if &filetype == 'c'

        call append(line(".")+6, "#include <stdio.h>")

        call append(line(".")+7, "")

    endif


endfunc 

"新建文件后，自动定位到文件末尾

autocmd BufNewFile * normal G


" RESET {{{1

"set whichwrap=b,s,<,>,[,] 
set iskeyword+=-

hi ColorColumn ctermbg=lightgrey guibg=lightgrey
