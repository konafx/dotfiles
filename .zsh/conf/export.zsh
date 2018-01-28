# export.zsh

# 言語設定
export LANG=ja_JP.UTF-8

# 環境変数
export PATH=${HOME}/local/bin:${HOME}/.local/bin:${PATH}

if [ -z "$DISPLAY" ]; then
    export DISPLAY="localhost:0.0"
fi
