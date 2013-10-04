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

au BufNewFile,BufRead *.gradle set filetype=groovy

set rtp+=$SCALA_PLUGIN/vim
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
