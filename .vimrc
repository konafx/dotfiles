" langcode
set fenc=utf-8
filetype on

" tab
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set list listchars=tab:\▸\-

if has("autocmd")
  autocmd FileType vim,html,xhtml,vue setlocal tabstop=2  "markup lang
endif

" cache
set nobackup
set noswapfile

" view
set number
set visualbell
set showmatch
" ステータスラインを常に表示
set laststatus=2
" ステータスラインの表示
set statusline=%<                           " shorted-position
set statusline+=%f\                         " file [space]
set statusline+=%m%r%h                      " flag(mod, readonly, help)
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}%=  " Git-branch-name stop
set statusline+=%-14.(%l,%c,%v%)            " LEFT: #(line, col-b, col-vir)
set statusline+=\ \[ENC=%{&fileencoding}]%P " fileenc current-position

set wildmode=list:longest
syntax on

" search
set ignorecase
set smartcase
set wrapscan
" hylight
set hlsearch
" clear hylight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
  if 0 == a:0
      let l:arg = "."
  else
      let l:arg = a:1
  endif
  execute "%! jq \"" . l:arg . "\""
endfunction
" plugin
" nerdtree
let NERDTreeShowHidden=1
noremap <S-t> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
