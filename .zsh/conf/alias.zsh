# alias.zsh

# --------------------
# ls
case "${OSTYPE}" in
    darwin*)
        alias ls='ls -FG'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac
alias ll='ls -l'
alias la='ls -a'

# --------------------
alias mkdir='mkdir -p'

# デバックモードでビルド
alias cmake_debug='cd ~/project/opencv_ex/build; cmake .. -DCMAKE_BUILD_TYPE=Debug'

# 解凍
alias extract='extract-file'
