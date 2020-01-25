# function test_no_unpushed_commits -d 'Check commits unpushed remote'
#     set -l msg (git log --branches --not --remotes --simplify-by-decoration --decorate --oneline --color=always)
#     [ -z "$msg" ]; and return 0; or echo "There are unpushed commits:"; return 1
# end

function ghq-remove -d 'Remove(Delete) local repository'
    ghq list --full-path | fzf | read repo_path
    [ -z "$repo_path" ]; and return; or echo "Remove $repo_path ? (Y/n)"; read allow_remove_repo

    # https://github.com/x-motemen/ghq/pull/116
    [ "$allow_remove_repo" = "Y" ]; and rm -rf $repo_path; or return
end
