call pathogen#infect()
set nocompatible            "Prefents VIM from being nerfed into acting like VI

" Set no max file limit
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

let mapleader=","           "Changes Leader key into a comma instead of a backslash

set history=2000

set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,tmp/**,vendor/**

" Visual Options
set laststatus=2        " Always Show The Status Bar
set ruler               " Show Line/Col Num in Status Bar
set nowrap              " Don't Wrap Lines
set rnu                 " Relative Line Numbers
set number              " Current Line Number
set cmdheight=2         " Enlarge Command Area To Avoid ENTER TO CONTINUE madness
set showmatch           " Highlight Matched Braces
set cursorline          " Show Horizontal Rule on Current Line
set cc=0                " Don't Show Vertical Ruler

set confirm             " Confirm Actions (like quitting with unsaved changes)

" When using splits only show the horizontal rule on active pane
au WinLeave * set nocursorline "nocursorcolumn
au WinEnter * set cursorline "cursorcolumn

" Tab Management
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab

set lazyredraw " Do not redraw when executing macro

" Search related
set ignorecase
set smartcase
set hlsearch
set incsearch

set magic " For regx

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Commands
"   Remove trailing whitespaces
map <Leader>, :%s/\s\+$//<CR>
au BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif
map <Leader>' :s/\'\(.*\)\'/\"\1\"<CR>
map <Leader>" :s/\"\(.*\)\"/\'\1\'<CR>

" Enable mouse in terminal if possible.
if has("mouse")
    set mouse=a
endif

" Syntax stuffs
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.tpl set filetype=smarty
au BufRead,BufNewFile *.php set tags=~/tags
au FileType ruby set tabstop=2 | set shiftwidth=2 | set softtabstop=2

" Add local vim concerns
if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif
