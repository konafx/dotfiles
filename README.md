# README
## [Go](https://github.com/golang/go)
### Install
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go
```

### Configure
```
set -xU GOROOT /usr/local/go
set -xU GOPATH $HOME/.go
set -U fish_user_paths $GOROOT/bin $fish_user_paths
set -U fish_user_paths $GOPATH/bin $fish_user_paths
```

## [ghq](https://github.com/motemen/ghq)
```
go get github.com/motemen/ghq
```

### Edit ~/.gitconfig
``` .gitconfig
[ghq]
    root = ~/.ghq
```

## [dot](https://github.com/ssh0/dot)
```
go get github.com/ssh0/dot
set -U DOT_DIR $HOME/.dotfiles
set -U DOT_REPO https://github.com/<user>/dotfiles.git
set -U DOT_SCR $GOROOT/src/dot
```

### Get plugin [fish-dot](https://github.com/re3turn/fish-dot)
```
fisher add re3turn/fish-dot
```

## Configure dot
### Make config file
```
dot config
```

### Edit .config/dot/dotrc
コメントアウトを外す
```
clone_repository='https://github.com/konafx/dotfiles.git
dotdir='$HOME/.dotfiles'
dotlink='$dotdir/dotlink'
linkfiles=("${dotlink}")
edit2filecmd='vimdiff'
dot_edit_default_editor='vim +'
```

### Clone dotfiles
```
dot clone && dot set
```

## Enable ssh to remote repository
```
(mkdir ~/.ssh &&) cd ~/.ssh && ssh-keygen -t rsa
```

```
git remote set-url git@github.com:konafx/dotfiles.git
```

check: `$ git fetch`

# etc
## pyenv
### インストール
```
$ git clone https://github.com/pyenv/pyenv.git ~/.pyenv
$ set -xU PYENV_ROOT $HOME/.pyenv
$ set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
    # eval "$(pyenv init -)"はfishじゃだめ
```

``` fish:.config/fish/config.fish
. (pyenv init - | psub)
```
> [pyenv + fish 環境構築 - Qiita](https://qiita.com/tkmpypy/items/9bd9692ad44dcd5710da)

### pythonのインストール
> ```
> sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
> libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
> xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
> ```
> [Common build problems · pyenv/pyenv Wiki](https://github.com/pyenv/pyenv/wiki/Common-build-problems)

```
$ pyenv install 3.8.1
$ pyenv global 3.8.1
```

## docker
```
curl https://raw.githubusercontent.com/docker/docker-ce/master/components/cli/contrib/completion/fish/docker.fish -o ~/.config/fish/completions/docker.fish
curl https://raw.githubusercontent.com/docker/compose/master/contrib/completion/fish/docker-compose.fish -o ~/.config/fish/completions/docker-compose.fish
```
