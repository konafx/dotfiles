# dotfiles
嘘英語とググリティの結晶

## TODO
1. Get `dotfiles`.
1. Run `setup.sh`.
1. END

## Description of each files, directory
### setup.sh
初期設定ファイル.  
3行目の`DOTFILES` をホームディレクトリへコピーする.  
`zplug` と`dein.vim` 稼働するように設定はしている.

### .zshrc
`zsh` の設定ファイル.  
`zplug` もぶっこむように設定はしている.  

なお, 肝心の`zplug` は完全に使えていない.

### .vimrc
`vim` の設定ファイル.
`dein.vim` も入れてる.
あわよくばこっちは使えていることを期待している.

### .screenrc
`screen` の設定ファイル.

`tmux` のほうが人気があるのだが, 大学環境では`screen` しか入ってなかったので`screen` を使っていた.

### .gitconfig
`git` のグローバル設定ファイル.
`gitignore`を読み込むような設定と, 各リポジトリ？毎にuserなどの設定をしろ, としか書いてない.

### .gitignore
`git` の設定ファイル. その2.
実行ファイルを読まないで, としか書いてない.

### README.md
このファイル.
Only English か 日本語OKなのか, 正直英語オンリーでもGoogle translateが活躍するだけ.
