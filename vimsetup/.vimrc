call pathogen#infect()

"pathogen#helptags() # command-t

let g:CommandTMaxFiles=40000

let mapleader=","           "Changes Leader key into a comma instead of a backslash

set nocompatible            "Prefents VIM from being nerfed into acting like VI
set history=2000


"# Visual Options
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,tmp/**

set ruler "Show current position
set rnu
set number
set laststatus=2
set nowrap
set cmdheight=2
set confirm
"set hidden "Buffer is hidden when abandoned
set showmatch

"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
au WinLeave * set nocursorline 
au WinEnter * set cursorline
set cursorline
set cc=0

"# Behavior 
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab

set lazyredraw " Do not redraw when executing macro

"Search related
set ignorecase
set smartcase
set hlsearch
set incsearch

set magic " For regx

"No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"Backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"# Commands
"Remove trailing whitespaces
map <Leader>, :%s/\s\+$//<CR>i

"Enable mouse in terminal if possible.
if has("mouse")
    set mouse=a
endif

"Syntax stuffs
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.tpl set filetype=smarty
au BufRead,BufNewFile *.php set tags=~/tags
au FileType ruby set tabstop=2 | set shiftwidth=2 | set softtabstop=2

if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
