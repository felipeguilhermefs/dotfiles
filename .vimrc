set nocompatible "IMproved required

" ==========================================================
" Basic Settings
" ==========================================================
filetype on
filetype plugin indent on "plugin and indentation by filetype
syntax enable

""" Messages, Info, Status
set vb t_vb= " Disable all bells.
set report=0 " : commands always print changed line count.

""" Format
set linebreak " don't wrap textin the middle of a word
set textwidth=79

""" Spelling
set nospell

""" Moving Around/Editing
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3 " Keep 3 context lines above and below the cursor
set cursorline " have a line indicate the cursor location

"""" Reading/Writing
set encoding=utf8
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

" ==========================================================
" Typed Config
" ==========================================================

" Git
autocmd Filetype gitcommit setlocal textwidth=72

" ==========================================================
" Key Mapping
" ==========================================================

" Buffer Control

map<leader>n :bn<cr>
map<leader>p :bp<cr>
map<leader>d :bd<cr>

