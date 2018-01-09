"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置和 vi 兼容
set nocp
set nocompatible

"设置行号
set number

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"打开状态栏标尺
set ruler


"设置 \t 转换为空格
set expandtab
"设置制表符宽度为4
"set tabstop=4
"设置缩进的空格数为4
set shiftwidth=4
set softtabstop=5

"设置自动缩进
set autoindent
"设置使用C/C++自动缩进
set cindent                           
"根据不同的文件类型设置不同的 indent ,默认配置 在/usr/share/vim/vim74/indent
filetype plugin indent on

"80字符
set colorcolumn=81
"自动换行
set textwidth=80
"添加中文字符检测
set fo+=mB

"关闭自动换行
"set nowrap
"nnoremap <F4> :set wrap!<CR>

"搜索忽略大小写
set ic
"搜索高亮显示
set hlsearch
"未输入完成就开始检索
set incsearch
"set is 
"nnoremap <F5> :set hlsearch!<CR>


"关键字上色
syntax on


"文件编码格式 从 utf-8 一次检测 ,若再有乱码问题,可以考虑插件 fencview.vim
set fileencodings=utf-8,chinese,latin-1


"高亮当前行
set cursorline


"智能补全命令行
set wildmenu


"不使用代码折叠功能
set nofoldenable


"configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=./vimtags

"表示不需要备份文件
set nobackup                       
"表示不创建临时交换文件
"set noswapfile

"表示使用系统的粘贴板上的代码粘贴,但不适用 terminal-style 的 终端(X windows)
set clipboard+=unnamed

"打开vim支持256色
set t_Co=256
"主题设置为沙漠
colorscheme desert

"退格键使能(在 insert 模式下 C+h 不管用)
"set backspace=indent,eol,start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>

"插件安装管理
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"空格映射冒号
nnoremap <space> :
vnoremap <space> :

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Vundle 插件
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

call vundle#end()
filetype plugin indent on


"其他插件
"在 call vundle#begin() 和 call vundle#end() 之间加入你想要配置插件的名字
"这里都是要安装的插件
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"Vundle 支持多种插件源，
"其中 Raimondi/delimitMate 这中写法表示
"安装 github 上 Raimondi 用户的 delimitMate 插件
"Plugin 'Raimondi/delimitMate'

"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'


call vundle#end()


" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可
" h: vundle         - 获取帮助

"添加完之后,重新打开vim ,然后 :PluginInstall

"下面可以写各插件的配置




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" else 区
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保留vim 上次编辑位置,下次从这里打开
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif   

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map ff :call Search_Word()<CR>:copen<CR>
function Search_Word()
	let w = expand("<cword>") " 在当前光标位置抓词
	execute "vimgrep " w " *"
endfunction

nmap <F4> :cn<cr>
nmap <F3> :cp<cr>

function! QFSwitch()
	redir => ls_output
	execute ':silent! ls'
	redir END

	let exists = match(ls_output, "[Quickfix List")
	if exists == -1
		execute ':copen'
	else
		execute ':cclose'
		execute ':TrinityToggleAll'
		execute ':TrinityToggleAll'
	endif
endfunction

map <C-o> <ESC>:call QFSwitch()<CR>

" Open and close all the three plugins on the same time 
nmap <F8>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
nmap <F9>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
nmap <F10>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
nmap <F11>  :TrinityToggleNERDTree<CR>





""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""

"由于插件原因,下面的映射被覆盖了,重写以便就好了
nnoremap <space> :
vnoremap <space> :




