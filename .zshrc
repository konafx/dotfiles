# ~/.zshrc
for f in ~/.zsh/conf/*.zsh; do
    source $f
done

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

