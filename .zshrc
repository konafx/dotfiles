# The following lines were added by compinstall
zstyle ':completion:*:default' menu select=2

autoload -U compinit; compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# PATH to ~/local/bin
export PATH=${HOME}/local/bin:${PATH}

# PROMPT
PROMPT='[%F{cyan}%*%f] %n@%~
$ '
