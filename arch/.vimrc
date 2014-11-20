set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Syntax checking & tab completion
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'

" Language-specific plugins
Plugin 'wting/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'bartlomiejdanek/vim-dart'

" Airline + status bar plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'


" Color schemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'veloce/vim-aldmeris'
Plugin 'dsolstad/vim-wombat256i'

call vundle#end()

filetype plugin indent on

set t_Co=256
colorscheme wombat256i

"let g:solarized_visibility = "high"
"let g:solarized_constrast = "high"

set encoding=utf-8

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

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
set wildmode=longest,list
set showcmd
set ruler
"set mouse=a

syntax on

no h i
no i k
no j h
no k j
no l l

inoremap jl <esc>
inoremap lj <esc>
vnoremap jl <esc>
vnoremap lj <esc>

noremap ; $

"noremap gi gk
"noremap gk gj

"noremap  <buffer> <silent> i gk
"noremap  <buffer> <silent> k gj
"noremap  <buffer> <silent> 0 g0
"noremap  <buffer> <silent> $ g$


let &colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

highlight ExtraWhitespace ctermbg=darkmagenta guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

runtime macros/matchit.vim

set laststatus=2
set timeoutlen=50
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space="\ua0"

