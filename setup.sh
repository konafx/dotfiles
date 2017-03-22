#!/bin/bash

DOTFILES=(.zshrc .vimrc .screenrc .gitconfig .gitignore)

for file in ${DOTFILES[@]}
do
	ln -fnsv $HOME/dotfiles/$file $HOME/$file
done

if [ ! -d ~/.zplug ]; then
	curl -sL zplug.sh/installer | zsh
fi
if [ ! -d ~/.vim/bundles ]; then
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.vim/bundles
	rm -f ./installer.sh
fi
