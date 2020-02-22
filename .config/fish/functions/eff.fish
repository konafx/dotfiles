function eff -d 'edit fish file' -a maxdepth
    [ -z "$maxdepth" ]; and set maxdepth 2
    set fishfile (find $__fish_config_dir -type f,l -maxdepth $maxdepth | sed -e "s@$__fish_config_dir@@" | fzf)

    set -l editor vim
    [ -n "$EDITOR" ]; and set editor $EDITOR

    [ -n "$fishfile" ]; and eval "$editor" $__fish_config_dir$fishfile
    commandline -f repaint
end
