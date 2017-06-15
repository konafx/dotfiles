## --------------------
## ZPLUG
#source ~/.zplug/init.zsh
#
## Define plugins
##zplug "zsh-users/zsh-history-substring-search"
##
##zplug "mollifier/cd-gitroot"
## リビジョンロック機能を持つ
#
#zplug "b4b4r07/enhancd"
##zplug "mollifier/anyframe"
#
### Gist ファイルもインストールできる
###zplug "b4b4r07/79ee61f7c140c63d2786", \
###	from:gist, \
###	as:command, \
###	use:get_last_pane_path.sh
###
#### bitbucket も
###zplug "b4b4r07/hello_bitbucket", \
###	from:bitbucket, \
###	as:command, \
###	use:"*.sh"
#
## 未インストール項目をインストールする
#if ! zplug check --verbose; then
#	printf "Install? [y/N]: "
#	if read -q; then
#		echo; zplug install
#	fi
#fi
#
#zplug load --verbose
#
# --------------------
zstyle ':completion:*:default' menu select=2

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# cd by directory name
setopt auto_pushd

# Use color
autoload -Uz colors; colors
# Use completion
autoload -U compinit; compinit

# LANG
export LANG=ja_JP.UTF-8

# sync history
setopt share_history

# Directly specify the directory name
setopt auto_cd
function chpwd() { ls }

# --------------------
# PATH
# to ~/local/bin
export PATH=${HOME}/local/bin:${HOME}/.local/bin:${PATH}

# --------------------
# PROMPT
PROMPT='[%F{cyan}%*%f] %n@%~
$ '

# --------------------
# ALIAS

# ls
alias ls='ls -F --color'
alias la='ls -a'
alias ll='ls -l'

# mkdir
alias mkdir='mkdir -p'

# --------------------
#

# .zprofile
if [ $SHLVL = 2 ];then
    screen
fi
