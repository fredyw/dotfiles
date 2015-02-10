set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

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

au BufNewFile,BufRead *.gradle set filetype=groovy

call vundle#end()
filetype plugin indent on
