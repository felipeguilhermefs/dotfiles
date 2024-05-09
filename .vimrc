set nocompatible "IMproved required

" ==========================================================
" Basic Settings
" ==========================================================
filetype on
filetype plugin indent on "plugin and indentation by filetype
syntax enable

""" Messages, Info, Status
set vb t_vb= " Disable all bells.
set confirm " Y-N-C prompt if closing with unsaved changes.
set report=0 " : commands always print changed line count.
set ruler " Show some info, even without statuslines.
set ls=2 " Always show statusline, even if only 1 window.
set title " show title in console title bar
set wildmenu " Menu completion in command mode on <Tab>

""" Format
set linebreak " don't wrap textin the middle of a word
set textwidth=79
set autoindent " always set autoindenting on
set matchpairs+=<:> " show matching <> (html mainly) as well
set foldmethod=indent " allow us to fold on indents
set foldlevel=99 " don't fold by default
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅ "help find incorrect chars

""" Spelling
set nospell

""" Moving Around/Editing
set virtualedit=block " Let cursor move past the last char in <C-v> mode
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

" ==========================================================
" Typed Config
" ==========================================================

" Git
autocmd Filetype gitcommit setlocal textwidth=72

" ==========================================================
" Key Mapping
" ==========================================================

" Window Jump
map<leader>j <c-w>j
map<leader>k <c-w>k
map<leader>l <c-w>l
map<leader>h <c-w>h

" Buffer Control

map<leader>n :bn<cr>
map<leader>p :bp<cr>
map<leader>d :bd<cr>

