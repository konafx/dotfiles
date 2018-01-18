# prompt.bash

if [ -n "$SSH_CLIENT" ]; then
    text=" ssh-session"
fi
export PS1='[\[\e[0;36m\]\t\[\e[0m\]] \h@\W\n${text}$ '
