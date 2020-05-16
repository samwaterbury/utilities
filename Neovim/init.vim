set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set backspace=2
set mouse=a
set scrolloff=5
set ruler
set number

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'haishanh/night-owl.vim'
"Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Enable 24-bit true color
set termguicolors

" Syntax highlighting
syntax enable
colorscheme night-owl

" Configure lightline
set laststatus=2
let g:lightline = { 'colorscheme': 'nightowl' }

