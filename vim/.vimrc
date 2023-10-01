set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

set encoding=utf-8
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
set pastetoggle=<F2>

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-e> :Buffers<CR>

au BufNewFile,BufRead *.gradle set filetype=groovy

call vundle#end()
filetype plugin indent on

syntax on
