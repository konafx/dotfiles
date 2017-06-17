@echo off
cls
:start

mklink %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\.vimrc 
mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\.vimrc 
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\.gvimrc 

:end
exit \b 0
