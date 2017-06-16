#!/bin/bash

DOTFILES=(.zshrc .vimrc .screenrc .screen .gitconfig .gitignore)
# .zprofileは読み込んでくれない。

for file in ${DOTFILES[@]}
do
	ln -fnsv $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.zplug ]; then
	export ZPLUG_HOME=$HOME/.zplug
	git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi
if [ ! -d ~/.vim/bundles ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.vim/bundles
	rm -f ./installer.sh
fi
