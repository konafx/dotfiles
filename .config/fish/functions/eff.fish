function eff -d 'edit fish functions'
    set -l fish_func_path $HOME/.config/fish/functions

    set -l func_name
    if test -n "$argv[1]"
        set func_name $argv[1]
        # Add suffix ".fish"
        string match -qr '\.fish$' $func_name; or set func_name $func_name.fish
    else
        set func_name (ls $fish_func_path --color | fzf --ansi --tac)
    end

    set -l editor vim
    [ -n "$EDITOR" ]; and set editor $EDITOR

    [ -n "$func_name" ]; and eval "$editor" $fish_func_path/$func_name
    commandline -f repaint
end
