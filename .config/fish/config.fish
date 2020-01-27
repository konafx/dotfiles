umask 022
# set -x FZF_LEGACY_KEYBINDINGS 0
# if test -x go
#     set -x GOPATH $HOME/.go
#     set -x PATH $PATH $GOPATH/bin
# end
# set -x VIMPATH $HOME/.vim/pack/mypackage/start
# set -x VOLTPATH $HOME/.volt
# 
# set -x VAGRANT_WSL_ENABLE_WINDOWS_ACCESS 1
# set -x PATH $PATH $HOME/.nvm/versions/node/v12.13.0/bin
# set -x PATH $PATH "/mnt/c/Program Files/Oracle/VirtualBox"
# set -x VAGRANT_WSL_WINDOWS_ACCESS_USER kon04
# set -x VAGRANT_WSL_WINDOWS_ACCESS_USER_HOME_PATH /mnt/z/Vagrant
# set -x RUBYOPT "-W0"

# pyenv
# set -Ux PYENV_ROOT $HOME/.pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
. (pyenv init - | psub)

# Edit rc file
alias ef='vim $HOME/.config/fish/config.fish'
alias ev='vim $HOME/.vimrc'

alias reload='exec fish'

# alias
alias mkdir='mkdir -p'

# shortcut alias
alias g='git'
alias gst='git status'

# For github local, remote
alias gh='hub browse (ghq list | fzf | cut -d "/" -f 2,3)'

alias ssh_vagrant='sudo ssh -l vagrant -p 2222 -i /mnt/z/Vagrant/.vagrant/machines/default/virtualbox/private_key 127.0.0.1'

# bobthefish
set -g theme_display_date yes

thefuck --alias | source
