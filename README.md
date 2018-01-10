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

第一步，备份。

        # mv ~/.vim backup
        # mv ~/.vimrc backup

第二步，复制配置。

        # git clone git@github.com:lisider/.vim.git ~/.vim
        # git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
第三步，创建.vimrc链接

        # ln -s ~/.vim/.vimrc ~/.vimrc
        
最后，Enjoy it!

```
