# zplug.zsh

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
