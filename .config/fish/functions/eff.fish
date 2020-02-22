function eff -d 'editk fish file'
    set options (fish_opt -s s -l conf -o --long-only)
    set -a options (fish_opt -s f -l function -o --long-only)
    set -a options (fish_opt -s a -l completion -o --long-only)
    argparse -n eff $options -- $argv
    or return

    set -q _flag_conf; and set parent 'conf.d'
    set -q _flag_function; and set parent 'functions'
    set -q _flag_completion; and set parent 'completions'
    if set -q parent
        [ -n "$argv[1]" ]; and set filename $argv[1]; or set filename (ls $__fish_config_dir/$parent | fzf)
        string match -qr '\.fish$' $filename; or set filename $filename'.fish'
        set fishfile $__fish_config_dir'/'$parent'/'$filename
    else
        set fishfile $__fish_config_dir(find $__fish_config_dir -type f,l | sed -e "s@$__fish_config_dir@@" | fzf)
    end

    set editor vim
    [ -n "$EDITOR" ]; and set editor $EDITOR

    [ -n "$fishfile" ]; and eval "$editor" $fishfile
    commandline -f repaint
end

