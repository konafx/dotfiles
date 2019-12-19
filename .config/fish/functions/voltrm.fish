# Enhanced `volt rm` with peco
function voltrm
    set -l repository (volt list | sed -r '1,2d; s/^[\ \t]+github\.com\///' | peco)
    if test -n "$repository"
        volt rm $repository
    else
        echo "Not selected"
    end
end
