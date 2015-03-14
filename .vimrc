execute pathogen#infect()
syntax on
filetype plugin indent on
filetype indent on
set nocompatible
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show hidden files in NerdTree
let NERDTreeShowHidden=1
"
"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"vim-auto-save plugin - enable AutoSave on Vim startup
let g:auto_save = 1 
