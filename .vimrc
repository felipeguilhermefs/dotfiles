set nocompatible "IMproved required

filetype off "required for vundle

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompletMe'

call vundle#end()

" ==========================================================
" Basic Settings
" ==========================================================
let mapleader=";" " change the leader to be a semicolon

syntax on
filetype on
filetype plugin indent on "plugin and indentation by filetype


""" Messages, Info, Status
set vb t_vb= " Disable all bells.
set confirm " Y-N-C prompt if closing with unsaved changes.
set report=0 " : commands always print changed line count.
set ruler " Show some info, even without statuslines.
set ls=2 " Always show statusline, even if only 1 window.
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>

""" Format
set tabstop=2 "how many spaces a tab take
set shiftwidth=2 "the depth of autoindentation, keep the same as above
set shiftround "indent in multiples of shiftwidth
set softtabstop=2 " <BS> over an autoindent deletes both spaces.
set expandtab "tabs to spaces
set linebreak " don't wrap textin the middle of a word
set textwidth=79
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅ "help find incorrect chars

""" Spelling
set nospell

""" Moving Around/Editing
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set nu "add line numbers
set scrolloff=3 " Keep 3 context lines above and below the cursor
set cursorline " have a line indicate the cursor location
set splitbelow " Horizontal splits open below current file
set splitright " Vertical splits open to the right of the current file

"""" Reading/Writing
set encoding=utf8
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

""" Searching and Patterns
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set smarttab " Handle tabs more intelligently
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex

" ==========================================================
" Typed Config
" ==========================================================

" Git
autocmd Filetype gitcommit setlocal textwidth=72

" ==========================================================
" Key Mapping
" ==========================================================

" Window Jump
map<c-j> <c-w>j
map<c-k> <c-w>k
map<c-l> <c-w>l
map<c-h> <c-w>h

" Buffer Control

map<leader>n :bn<cr>
map<leader>p :bp<cr>
map<leader>d :bd<cr>

" ==========================================================
" Plugins
" ==========================================================

""" Solarized
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

""" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>t :NERDTreeToggle<CR>

""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'

"" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode = 'ra'
