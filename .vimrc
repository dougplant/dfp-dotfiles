# sudo yum install vim-enhanced

set number

" load indentation rules and plugins according to the detected filetype
if has("autocmd")
  filetype plugin indent on
endif

" use a tab size of 4, and expand the tab character into spaces
set tabstop=4
set expandtab
set paste

" enable syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
colorscheme koehler

set autoindent
set smartindent

" highlight search
set hlsearch

" Do case insensitive matching
set ignorecase         

set nocompatible
