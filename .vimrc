scriptencoding utf-8
" utf-8で書かれたスクリプトである

" setting
set enc=utf-8
set fenc=utf-8,cp932,sjis,iso-2022-jp
set ff=unix,dos,mac
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 見た目系
" 行番号を表示
set number
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" color
syntax on


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" shiftwidthを設定するためsmarttabをONにする
set smarttab
" 画面上でタブ文字の占める幅
set tabstop=4
" 行頭のタブ文字の占める幅, 自動インデントの際に作用
set shiftwidth=4
" C言語風にインデントを増減させる
set smartindent
" 1 tab->4 harf-space
set expandtab

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 補完
" 補完にopencv2を追加
let $BOOST_ROOT = "/usr/local/include/opencv2"
set path+=$BOOST_ROOT

" dein.vim ---------------
if &compatible
	set nocompatible
endif
set runtimepath^=~/.vim/bundles/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/bundles'))

call dein#add('Shougo/dein.vim')
" Template: call dein#add('JohnDoe/plugin.vim')
call dein#add('Shougo/neosnippet-snippets')
" 補完用プラグイン, need: lua
" lua を入れるのに四苦八苦してるのでとりあえず入れない方向で
" call dein#add('Shougo/neocomplete.vim', {'on_i': 1})
call dein#add('plasticboy/vim-markdown', { 'on_ft': 'md'})
" git連携用プラグイン
call dein#add('tpope/vim-fugitive')

call dein#end()

" Auto install
if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
" Endline of dein.vim ----------
