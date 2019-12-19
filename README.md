# README
## Before
### Install [Go](https://github.com/golang/go)
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-go
```

### Configure PATH on fish
```
set -xU GOPATH $HOME/.go
set -U fish_user_paths $GOPATH/bin $fish_user_paths
```

### Install [ghq](https://github.com/motemen/ghq)
```
go get github.com/motemen/ghq
```

### Install [dot](https://github.com/ssh0/dot)
```
ghq get ssh0/dot
```

### Install [fish-dot](https://github.com/re3turn/fish-dot)
```
fisher add re3turn/fish-dot
```

### Configure dot
#### Make config file
```
dot config
```

#### Edit .config/dot/dotrc
コメントアウトを外す
```
clone_repository='https://github.com/konafx/dotfiles.git
dotdir='$HOME/.dotfiles'
dotlink='$dotdir/dotlink'
linkfiles=("${dotlink}")
edit2filecmd='vimdiff'
dot_edit_default_editor='vim +'
```

#### Clone dotfiles
```
dot clone && dot set
```

## After
### Enable ssh to remote repository
```
(mkdir ~/.ssh &&) cd ~/.ssh && ssh-keygen -t rsa
```

```
git remote set-url git@github.com:konafx/dotfiles.git
```

check: `$ git fetch`
