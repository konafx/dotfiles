setopt IGNOREEOF

# 環境変数 {{{
export GOPATH=$HOME/.go
export PATH="$PATH:$GOPATH/bin"

export PATH="$PATH:$HOME/.cargo/bin"

export TRANSPARENT_TERM=1
# }}}

# LOCALE {{{
export LC_TIME=en_US.utf-8
export LANG=ja_JP.utf-8
# }}}

# Colored
autoload -Uz colors
colors

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu true select
zstyle ':completion:*:rm:*' menu false


# 他のターミナルとヒストリーを共有
setopt share_history

# ヒストリーに重複を表示しない
setopt histignorealldups

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd

# 自動でpushdを実行
setopt auto_pushd

# pushdから重複を削除
setopt pushd_ignore_dups

# コマンドミスを修正
setopt correct

# alias {{{
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'

# ls {{{
alias ls='ls --color=auto'
alias lst='ls -ltr'
alias l='ls'
alias la='ls -a'
alias ll='ls -l'
# }}}

alias so='source'
alias v='vim'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias c='cdr'
# historyに日付を表示
alias h='fc -lt '%F %T' 1'
alias cp='cp -i'
alias rm='rm -i'
alias mkdir='mkdir -p'
alias ..='c ../'
alias back='pushd'
alias diff='diff -U1'
# }}}

# cdの後にlsを実行
chpwd() { ls -ltr --color=auto }

# どこからでも参照できるディレクトリパス
cdpath=(~)

### Added by Zinit's installer {{{
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk }}}

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

zinit light zsh-users/zsh-completions
zinit light zsh-users/zaw
