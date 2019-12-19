function git_author_cleaner
    echo "Input author name"
    read author_name -l
    echo "Input author email"
    read author_email -l
    echo "Input committer name"
    read committer_name -l
    echo "Input committer email"
    read committer_email -l
    echo "GIT_AUTHOR_NAME=$author_name"\n"GIT_AUTHOR_EMAIL=$author_email"\n"GIT_COMMITTER_NAME=$committer_name"\n"GIT_COMMITTER_EMAIL=$committer_email"
    echo "Are you sure you want to continue rewrite author? (Y/n)"
    read confirm -l
    if test $confirm = 'Y';
        git filter-branch -f --env-filter "GIT_AUTHOR_NAME='$author_name'; GIT_AUTHOR_EMAIL='$author_email'; GIT_COMMITTER_NAME='$committer_name'; GIT_COMMITTER_EMAIL='$committer_email';" HEAD
    end
end
