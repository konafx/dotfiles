# --------------------
# alias
case "$OSTYPE" in
    darwin*)
        alias ls='ls -FG'
        ;;
    linux*)
        alias ls='ls -F --color=auto --ignore={NTUSER*,ntuser*}'
        ;;
esac
alias ll='ls -l'
alias la='ls -a'

# --------------------
# pythonをGit bashで動かす
if [ "$(uname)" == 'Linux' ];then
    OS='Linux'
else
    alias python='winpty python.exe'    
fi

# --------------------
# For campus
alias cadence='/home/course/logictut/bin/icds &'
alias spim='~nisim/pub/comparch/xspim &'
alias spim-solsv='~nisim/pub/comparch/xspim.i386 &'

# --------------------
# PROMPT
if [ -n "$SSH_CLIENT" ]; then
    text=" ssh-session"
fi
export PS1='[\[\e[0;36m\]\t\[\e[0m\]] \h@\W\n${text}$ '
