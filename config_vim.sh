#########################################################################
# File Name: config_vim.sh
# Author: Sues
# mail: sumory.kaka@foxmail.com
# Created Time: 2018年01月14日 星期日 14时00分51秒
# Version : 1.0
#########################################################################
#!/bin/bash

if [ -e ~/.vim_bak ]
then
    rm ~/.vim_bak -rf
else
    :
fi

mv ~/.vim ~/.vim_bak
mv ~/.vimrc ~/.vim_bak


git clone git@github.com:lisider/.vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/.vim/.vimrc ~/.vimrc

vi file <<ipipioipiopip
:PluginInstall
ipipioipiopip

