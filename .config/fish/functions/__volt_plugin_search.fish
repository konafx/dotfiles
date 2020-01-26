function __volt_plugin_search -d 'Search config file of vim plugin managed volt'
    set -l selected_plugin
    volt list | sed -r 's/^[\ \t]+//g; 1,2d' | fzf --ansi | read selected_plugin
    [ -n "$selected_plugin" ]; and vim $VOLTPATH/plugconf/$selected_plugin.vim
    commandline -f repaint
end
