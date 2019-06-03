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

call plug#begin('~/.vim/plugged')
" Vim-Plug plugins go here
call plug#end()

" Syntax highlighting
syntax enable
colorscheme delek-nobold

" Fix scrolling which is too fast on macOS
if has('macunix')
    map <ScrollWheelUp> <C-Y>
    map <ScrollWheelDown> <C-E>
endif
