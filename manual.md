# Manual
## zsh
## bash
## vim
### 分割
- `:vsp` 横分割

### cd
- `:ch %:h`: global current directoryを変更
- `:lcd %:h`: local current directoryを変更
- `:pwd`

### vim-fugitive
- `:Gstatus`
    - `-`: add/reset
    - `p`: add/reset --patch
    - `C` or `cc`: commit
    - `D`: diff
- `:Gread`: HEADまでコードを復元
- `:Gbrowse`: Open file on Github

## screen
### 起動
- `$ screen`: START
- `-r <name>`: ATTACH to session
- `-S <name>`: start a NEW SESSION
- `-x`: attach to runnning

### 退出
- `C-a d`: DETACH
- `C-a D D`: and LOGOUT(quick exit)

### Window Management
- `C-a c`: CREATE new window
- `C-a <num>`: CHANGE to num
- `C-a ' <name of num>`: CHANGE to name or num
- `C-a n`: FORWARD window
- `C-a p`: BACKWARD window
- `C-a "`: SEE window-LIST
- `C-a k`: KILL current window (BE CAREFUL)
- `C-a \`: KILL ALL windows (BE CAREFUL)
- `:title <name>`: RENAME current window <!-- - `C-a A` -->

### Split screen
- `C-a S`: split HORIZONtally
- `C-a |` or `C-a V`: split VERTICALly 
- `C-a tab`: FORWARD region
- `C-a h/j/k/l`: MOVE region
- `C-a X`: REMOVE current regiion
- `C-a Q`: REMOVE ALL regions (not current)

### Layout
- `C-a C-q`: Layout mode
-    +- `i`: INITialize
-    +- `m`: SELect layout from TEMPLATE
-    +- `c`: CREATE layout
-    +- `x`: DELETE layout
-    +- `n`: MOVE layout (next)
-    +- `p`: MOVE layout (prev)
-    +- `s`: SAVE layout

### Clipboard and Navi
- `C-a [`: buffer mode (FREELY)
    - `space`: toggle selection to COPY
- `C-a ]`: PASTE

### HELP
- `C-a ?`

### Misc
- `C-a x`: LOCK (passwd protect)
- `C-a :`: COMMAND mode
- `C-a H`: enable logging in the screen session

## git
