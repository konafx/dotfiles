#!/bin/bash

DOTFILES=(.zshrc .bashrc .vimrc .gvimrc .screenrc .screen .gitconfig .gitignore)
# .zprofileは読み込んでくれない。

for file in ${DOTFILES[@]}
do
    ln -fnsv $HOME/dotfiles/$file $HOME/$file
done

# pandoc用
ln -fnsv $HOME/dotfiles/src/header-luatexja.tex $HOME/local/src/header-luatexja.tex

if [ ! -d ~/.zplug ]; then
    export ZPLUG_HOME=$HOME/.zplug
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
if [ ! -d ~/.vim/bundles ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim/bundles
    rm -f ./installer.sh
fi
