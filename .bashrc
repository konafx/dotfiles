<<<<<<< HEAD
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enviroment variables
export PATH=$PATH:/usr/local/bin
export LM_LICENSE_FILE=1800@alterasv.u-aizu.ac.jp
export XILINXD_LICENSE_FILE=2100@adlsv04.u-aizu.ac.jp
export PATH=$PATH:/opt/altera/15.1/quartus/bin
export ALTERAOCLSDKROOT="/home/lab/yoichi/altera/15.1/hld"
export QSYS_ROOTDIR="/home/lab/yoichi/altera/15.1/quartus/sopc_builder/bin"

# export CUDA_HOME=/usr/local/cuda-7.5
export CUDA_HOME=/usr/local/cuda-8.0 # for docker on alpha1
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64 
PATH=${CUDA_HOME}/bin:${PATH} 
export PATH

export PYTHONPATH=/mnt/exp/DL/caffe/python:$PYTHONPATH
export PYLEARN2_DATA_PATH=/mnt/exp/DL/pylearn2data

export PATH=/mnt/exp/DL/pylearn2/pylearn2/pylearn2/scripts:$PATH
export PYLEARN2_VIEWER_COMMAND="eog --new-instance"

#----------------------------------------------------------------------------#

export PYENV_ROOT=$HOME/.pyenv
# /usr/local/cuda-9.1
export CPATH=$CUDA_HOME/include
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDA_HOME/lib64:$CUDA_HOME/targets/x86_64-linux/lib
export PATH=$PYENV_ROOT/bin:$CUDA_HOME/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH
eval "$(pyenv init -)"
source $(conda info --root)/etc/profile.d/conda.sh
alias activate="source $PYENV_ROOT/versions/anaconda3-5.1.0/bin/activate"
export TF_BINARY_URL_PY36=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.6.0-cp36-cp36m-linux_x86_64.whl

#--------------------------------------------------------------------------#
bash_conf=~/.bash/conf
for f in $bash_conf/*.bash; do
=======
# ~/.bashrc
for f in ~/.bash/conf/*.bash; do
>>>>>>> 0da28b2faab6116982d985b9e0b114d0bcead65e
    source $f
done
