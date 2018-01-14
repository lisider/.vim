- 是什么?
```c
     这是我的vim配置，当然，如果喜欢可以你可以随意拿去。(^_^)
```

- 有什么用?
```c
     使用vim 更舒服
```
- 有什么?
```c
    设置部分
          一些常用设置 
    插件部分
          Vundle 的设置
          注意,Vundle 没有安装,所以要在运行vi之前,把 Vundle 装好
          下面的流程已经做好了,按照流程做就好了
```

- 怎么用？

```c
curl -s https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh |bash
```

- 还能怎么做
```c
     0/因为我已经在 .vimrc 加了 13 个插件(除了 Vundle) 及
     配置,但是没安装,你可以安装
     1/在 Vundle 的设置中添加插件
     2/关闭vim
     3/打开vim
     4/在命令行下输入 :PluginInstall

```

- 我加了那些插件
```c
    " 1 Plugin1 vim-airline 状态栏
    
    " 2 Plugin2 ultisnips 自动扩展 及分片
    
    " 3 Plugin3 neocomplete.vim 候选列表"

    " 4 Plugin4 auto-pairs 括号数目匹配
    
    " 5 Plugin5 rainbow_parentheses.vim 括号颜色匹配 

    " 6 Plugin6 vim-multiple-cursors 多行编辑
    
    " 7 Plugin7 vim-easymotion 快速移动

    " 8 Plugin8 nerdtree 项目树
    
    " 9 Plugin9 ctrlp.vim 文件管理

    " A PluginA tagbar 函数列表 
    
    " B Plugin3 nerdcommenter 快速注释

    " C PluginC DoxygenToolkit.vim 注释文档
    
    " D PluginD supertab 解决 neocomplete.vim 和 ultisnips 的兼容问题

    " E PluginE csapprox 解决 文字终端和 图形终端色彩不同的问题 

    " F PluginF VisIncr  增强纵向编辑

```

- 这些插件怎么用

```c
     6
          可以ctrl +n 选择一样的 标识符,然后键入 c ,同时修改多个标识符

     7
          j5 跳到下面5行

     9
          Ctrl + p

     B
          选择 一个 代码块, ;cc 注释
          选择 一个 代码块, ;cu 去注释
     C
          光标位于第一行  :DoxAuthor
          光标位于第一行  :DoxLic
          光标位于函数声明  :Dox

     
```









- Vundle 支持的 设置语法
```c
     .vimrc 中有写

```




- 如果你还想要其他插件,从哪里找?
```c
     github
     注意: 某些 插件对 vim 有版本要求

```
