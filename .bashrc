alias ls='ls --color=auto --ignore={NTUSER*,ntuser*}'
alias la='ls -a'
alias ll='ls -l'

# pythonをGit bashで動かす
if [ "$(uname)" == 'Linux' ];then
    OS='Linux'
else
    alias python='winpty python.exe'    
fi
