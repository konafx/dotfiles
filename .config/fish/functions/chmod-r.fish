# fish version 3.0.2

function _chmod-r-with-type -d "chmod only for specified type"
    set -l path $argv[1]
    set -l type $argv[2]
    set -l permission $argv[3]
    find $path -type $type -exec chmod $permission {} +
end

function chmod-r
    if test "$argv" = "--help"; or test "$argv" = "-h"
        echo "Usage: chmod-r <path> <directory_permission> <file_permission>"
        echo "If occurred error 'permission denied', you should 'sudo chmod u+rwx -R <path>' before this command"
        return
    end

    set -l path $argv[1]
    set -l directory_type d
    set -l directory_permission $argv[2]
    set -l file_type f
    set -l file_permission $argv[3]
    if test -z "$directory_permission"
        set -l directory_permission 755
    end
    if test -z "$file_permission"
        set -l file_permission 644
    end 

    _chmod-r-with-type $path $directory_type $directory_permission
    _chmod-r-with-type $path $file_type $file_permission
end
