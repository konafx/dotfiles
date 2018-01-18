# function.zsh

# 解凍
function extract-file() {
    help() {
        echo 'unzip, untar, un...'
        echo 'Usage: extract filename'
        return
    }
    for file in $*; do
        case $file in
            *.zip)
                unzip $file ;;
            *.7z)
                7z x $file ;;
            *.rar)
                unrar x $file ;;
            *.tar)
                tar -xvf $file ;;
            *.tar.bz2|*.tbz2)
                tar -xjvf $file ;;
            *.tar.xz|*.txz)
                tar -xJvf $file ;;
            *.tar.gz|*.tgz)
                tar -xzvf $file ;;
            *.tar.Z|*.taz)
                tar -xZvf $file ;;
            *.bz2)
                bzip2 -d $file ;;
            *.gz)
                gzip -d $file ;;
            *.Z)
                uncompress $file ;;
        esac
    done
    return 1;
}

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
    help() {
        echo "USE pandoc"
        echo "pandoc $1 -o $2 --latex-engine=lualatex -H h-luatexja.tex"
        return
    }
    pandoc $1 -o $2 --latex-engine=lualatex -H ~/local/src/h-luatexja.tex
}
