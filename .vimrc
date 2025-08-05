set nocompatible
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set incsearch

" load indentation rules and plugins according to the detected filetype
if has("autocmd")
  filetype plugin indent on
endif

" enable syntax highlighting by default.
if has("syntax")
  syntax on
endif

set background=dark
colorscheme koehler

set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned

