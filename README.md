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


- 怎么用?

```c
1/
方法1
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh)"

方法2
bash -c "$(wget https://raw.githubusercontent.com/lisider/.vim/master/config_vim.sh -O -)"
```


- 我加了那些插件?
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
    
    " B PluginB nerdcommenter 快速注释

    " C PluginC DoxygenToolkit.vim 注释文档
    
    " D PluginD supertab 解决 neocomplete.vim 和 ultisnips 的兼容问题

    " E PluginE csapprox 解决 文字终端和 图形终端色彩不同的问题 

    " F PluginF VisIncr  增强纵向编辑
```


- 这些插件怎么用?
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


- Vundle 支持的 设置语法?
```c
     .vimrc 中有写
```


- 如果你还想要其他插件,从哪里找?
```c
     github
     vim源码
     vim邮件列表及vim插件
```


- 安装的时候及运行的时候会出什么问题?
```c
1/
     下载不下来脚本,因为github 是外国网站
2/
     下载不来插件,因为插件在github上
3/
     插件不支持vim
     1/ 插件 需要 更高的 vim版本
     2/ 插件 需要 vim 在编译时加上对某些脚本的支持特性 
          python lua
```
