@echo off

rem ���|�W�g���I��
for /f %%p in ('ghq list ^| fzf') do (
    rem ���|�W�g���̐e�f�B���N�g���̃p�X�擾
    for /f "DELIMS=" %%A in ('ghq root') do set repopath="%%A\%%p"
    cd /D %repopath%
    break
)

:end
