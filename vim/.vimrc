set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set ruler
set nobackup
set number
set ignorecase
set hlsearch
set wildmenu
set completeopt=longest,preview,menuone

inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

au BufNewFile,BufRead *.gradle set filetype=groovy
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.scala set filetype=scala

set rtp+=$SCALA_PLUGIN/vim
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
