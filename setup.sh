#!/bin/bash

DOTFILES=(.zshrc .zsh .bashrc .bash .vimrc .gvimrc .screenrc .screen .gitconfig .gitignore)
# .zprofileは読み込んでくれない。

# if [ -e ~/.bashrc -a ! -e ~/.bash/conf/localrc.bash ]; then
#     echo 'Already exist ~/.bashrc, you should backup .bashrc'
#     exit
# fi
# 
# for file in ${DOTFILES[@]}; do
#     ln -fnsv $HOME/dotfiles/$file $HOME/$file
# done

# pandoc用
ln -fnsv $HOME/dotfiles/src/header-luatexja.tex $HOME/local/src/header-luatexja.tex

# if [ ! -d ~/.zplug ]; then
#     export ZPLUG_HOME=$HOME/.zplug
#     git clone https://github.com/zplug/zplug $ZPLUG_HOME
# fi
if [ ! -d ~/.cache/dein ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm -f ./installer.sh
fi
