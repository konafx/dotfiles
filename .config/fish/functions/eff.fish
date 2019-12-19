function eff -d 'edit fish functions'
    set -l fish_func_path $HOME/.config/fish/functions

    if test -n "$argv[1]"
        set -g func_name $argv[1]

        # Add '.fish' if argv does't contain '.fish'
        string match -r '\.fish$' $func_name; if test $status -eq 1
            set -g func_name $func_name.fish
        end
    else
        set -g func_name (ls $fish_func_path --color | fzf --ansi --tac)
    end

    eval "$EDITOR $fish_func_path/$func_name"
end
