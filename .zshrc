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
# 色使う
autoload -Uz colors; colors
# Use completion
# 補完使う？
autoload -U compinit; compinit

# LANG
# 言語設定
export LANG=ja_JP.UTF-8

# sync history
# コマンド履歴の同期
setopt share_history

# Directly specify the directory name
# ディレクトリ名だけでcdできるように
setopt auto_cd
function chpwd() { ls }

# --------------------
# PATH
# 環境変数の設定
# to ~/local/bin
export PATH=${HOME}/local/bin:${HOME}/.local/bin:${PATH}

# --------------------
# PROMPT
# プロンプトの設定
PROMPT='[%F{cyan}%*%f] %n@%~
$ '

# --------------------
# ALIAS
# エイリアス

# ls
case ${OSTYPE} in
    darwin*)
        alias ls 'ls -FG'
        ;;
    linux*)
        alias ls 'ls -F --color=auto'
        ;;
esac
alias ll 'ls -l'
alias la 'ls -a'

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

# markdown -> pdf
function md2pdf (){
    # -h, --help
    help() {
        echo "USE pandoc"
        echo "pandoc $1 -o $2 --latex-engine=lualatex -H h-luatexja.tex"
        return
    }
    pandoc $1 -o $2 --latex-engine=lualatex -H ~/local/src/h-luatexja.tex
}

# --------------------
# 起動時の設定
# ~~というかprofileファイル自体、ログインシェル起動時にしか読み込まれないんですけどね。~~
# .zprofileが読み込まれていない。なぜ？
#
# シェルの深さが1のとき、つまりターミナル起動の際、GNU screenの起動をする。
# セッションがすでに有る場合、それにアタッチする。
# なかった場合、新たに起動する。
if [ $SHLVL = 1 ];then
    screen -xR
fi
