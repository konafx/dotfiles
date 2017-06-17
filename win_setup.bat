@echo off
cls

mklink %HOMEPATH%\.bashrc %HOMEPATH%\dotfiles\.bashrc 
mklink %HOMEPATH%\.vimrc %HOMEPATH%\dotfiles\.vimrc 
mklink %HOMEPATH%\_vimrc %HOMEPATH%\dotfiles\.vimrc 
mklink %HOMEPATH%\_gvimrc %HOMEPATH%\dotfiles\.gvimrc 
mklink %HOMEPATH%\.gitignore %HOMEPATH%\dotfiles\.gitignore 
mklink %HOMEPATH%\.gitconfig %HOMEPATH%\dotfiles\.gitconfig 

:: ::遅延環境変数(!i!)の有効化
:: setlocal ENABLEDELAYEDEXPANSION
:: 
:: ::dotfile -> dotfile
:: set DOT_1=.bashrc
:: set DOT_2=.vimrc
:: set DOT_3=.gitignore
:: set DOT_4=.gitconfig
::
:: set i=1
:: :DOT_BEGIN
:: call set it=%%DOT_!i!%%
:: if defined it (
::     echo !it!
::     mklink %HOMEPATH%\!it! %HOMEPATH%\dotfiles\!it! 
::     set /A i+=1
::     goto :DOT_BEGIN
:: )
:: 
:: ::dotfile -> underscore(_)file
:: set BAR_1=vimrc
:: set BAR_2=gvimrc
:: 
:: set j=1
:: :BAR_BEGIN
:: call set jt=%%BAR_!i!%%
:: if defined jt (
::     echo !jt!
::     mklink %HOMEPATH%\_!jt! %HOMEPATH%\dotfiles\.!jt! 
::     set /A j+=1
::     goto :BAR_BEGIN
:: )

exit 0
