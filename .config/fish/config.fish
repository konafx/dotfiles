umask 022

# Edit rc file
alias ev='vim $HOME/.vimrc'

alias reload='exec fish'

# alias
alias mkdir='mkdir -p'

# shortcut alias
alias v='vim'
alias g='git'
alias gst='git status'

# For github local, remote
#alias gh='hub browse (ghq list | fzf | cut -d "/" -f 2,3)'

alias ssh_vagrant='sudo ssh -l vagrant -p 2222 -i /mnt/z/Vagrant/.vagrant/machines/default/virtualbox/private_key 127.0.0.1'

# bobthefish
set -g theme_display_date yes
