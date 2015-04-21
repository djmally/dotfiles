set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" Syntax checking, highlighting, & tab completion
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'tpope/vim-endwise'

" Language-specific plugins
Plugin 'wting/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'bartlomiejdanek/vim-dart'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'Superbil/llvm.vim'

" Airline + status bar plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'nathanaelkane/vim-indent-guides'


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

" vvvvvvvvv Key Remapping vvvvvvvvv
inoremap jk <esc>
inoremap kj <esc>
vnoremap jk <esc>
vnoremap kj <esc>

noremap ; $

noremap <silent> <Leader>v :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Lkzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" ^^^^^^^^^ Key Remapping ^^^^^^^^^

au FileType ocaml setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType c setl sw=4 sts=4 et
au BufNewFile,BufRead *.oat set filetype=cpp

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

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers = ['merlin']

