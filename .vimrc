set nocompatible "IMproved required

filetype off "required for vundle

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'

call vundle#end()

" ==========================================================
" Basic Settings
" ==========================================================
let mapleader=";" " change the leader to be a comma vs slash

syntax on
filetype on
filetype plugin indent on "plugin and indentation by filetype


""" Messages, Info, Status
set vb t_vb= " Disable all bells.
set confirm " Y-N-C prompt if closing with unsaved changes.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler " Show some info, even without statuslines.
set ls=2 " Always show statusline, even if only 1 window.
set statusline=%F%m%r%h%w\ [POS=%04l,%04v\ %p%%\ %L]
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>

""" Format
set tabstop=4 "how many spaces a tab take
set shiftwidth=4 "the depth of autoindentation, keep the same as above
set shiftround "indent in multiples of shiftwidth
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab "tabs to spaces
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅ "help find incorrect chars

""" Spelling
set nospell
set spelllang=en,pt
set spellsuggest=5

""" Moving Around/Editing
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set nu "add line numbers
set scrolloff=3 " Keep 3 context lines above and below the cursor
set cursorline " have a line indicate the cursor location
set completeopt=menuone,longest,preview
set pumheight=6 " Keep a small completion window
set splitbelow " Horizontal splits open below current file
set splitright " Vertical splits open to the right of the current file
set history=50 "keep 50 lines of command line history

"""" Reading/Writing
set encoding=utf8
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set noautoread " Don't automatically re-read changed files.
set modeline " Allow vim options to be embedded in files;
set modelines=5 " they must be within the first or last 5 lines.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

""" Searching and Patterns
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set smarttab " Handle tabs more intelligently
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex

" ==========================================================
" Key Mapping
" ==========================================================

" Window Jump
map<c-j> <c-w>j
map<c-k> <c-w>k
map<c-l> <c-w>l
map<c-h> <c-w>h

au FileType py set autoindent "indent the next line
au FileType py set smartindent "indent after if, for ...
au FileType py set textwidth=79 " PEP8


" ==========================================================
" Plugins
" ==========================================================

""" Solarized
set background=dark
colorscheme solarized

""" NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
map <leader>n :NERDTreeToggle<CR>
