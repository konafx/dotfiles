#!/usr/bin/zsh

# This script performs the following actions:
# 1. Checks if the file ~/.config/zsh/.zshrc exists.
# 2. If the file ~/.config/zsh/.zshrc.zwc (compiled zsh script) exists,
#    it renames it to ~/.config/zsh/.zshrc.zwc.bak as a backup.
# 3. Compiles the ~/.config/zsh/.zshrc file into a zsh-compiled file (.zwc)
#    using the `zcompile` command.
#
# This script is intended to be run after changes are applied to the
# ~/.config/zsh/.zshrc file to ensure the compiled version is updated.

if [ -f ~/.config/zsh/.zshrc ]; then
    if [ -f ~/.config/zsh/.zshrc.zwc ]; then
	    mv ~/.config/zsh/.zshrc.zwc ~/.config/zsh/.zshrc.zwc.bak
    fi
    zcompile ~/.config/zsh/.zshrc
fi