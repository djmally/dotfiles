set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'solarnz/thrift.vim'
Plugin 'fatih/vim-go'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

set t_Co=256
colorscheme solarized
"let g:solarized_visibility = "high"
"let g:solarized_constrast = "high"

let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1

set number
"set relativenumber
set incsearch
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set hlsearch
set wildmenu
set showcmd
set ruler
"set mouse=a

syntax on


au FileType ruby setl sw=2 sts=2 et

no h i
no i k
no j h
no k j
no l l

"noremap gi gk
"noremap gk gj

"noremap  <buffer> <silent> i gk
"noremap  <buffer> <silent> k gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$

highlight ExtraWhitespace ctermbg=darkmagenta guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

runtime macros/matchit.vim

set laststatus=2
set timeoutlen=50
