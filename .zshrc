## --------------------
## ZPLUG
#source ~/.zplug/init.zsh
#
## Define plugins ##zplug "zsh-users/zsh-history-substring-search"
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
# GNU screen

# デタッチされているセッションを削除 
fuction screen-rm (){
    # -h, --help   
    help() {
        echo 'Usage:    screen-rm [host.tty]'
        echo '       or screen-rm *'
        return
    }
    screen -r -X quit;
    rm -rf /tmp/uscreens/S-kon/$1
}
# --------------------
# 起動時の設定
# というかprofileファイル自体, ログインシェル起動時にしか読み込まれないんですけどね.
#
# シェルの深さが1のとき, つまりターミナル起動の際, GNU screenの起動.
# セッションがすでに有る場合, それにアタッチする.
# なかった場合, 新たに起動する.
if [ $SHLVL = 1 ];then
    screen -xR
fi
