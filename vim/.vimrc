set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smarttab
set ruler
set nobackup
set number
set ignorecase
set smartcase
set hlsearch
set wildmenu
set incsearch
set showcmd
set autoindent
set cursorline
set completeopt=longest,preview,menuone
set guifont=Consolas\ 12
" set mouse=a

au BufNewFile,BufRead *.gradle set filetype=groovy

call vundle#end()
filetype plugin indent on
