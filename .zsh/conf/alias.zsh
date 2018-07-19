# alias.zsh

# --------------------
# ls
umask 022
case "${OSTYPE}" in
    darwin*)
        alias ls='ls -FG'
        ;;
    linux*)
        alias ls='ls -F --color=auto --show-control-chars -I "NTUSER.DAT*"'
        ;;
esac
alias ll='ls -l'
alias la='ls -a'
# --------------------

alias mkdir='mkdir -p'

# デバックモードでビルド
alias cmake_debug='cd ~/project/opencv_ex/build; cmake .. -DCMAKE_BUILD_TYPE=Debug'

# for SCCP
alias ping_rajikon='ping 192.168.11.222'
alias ssh_rajikon='ssh pi@192.168.11.222'
<<<<<<< HEAD
=======

alias relogin='exec $SHELL -l'
>>>>>>> 0da28b2faab6116982d985b9e0b114d0bcead65e
