local vim = vim

--------------------
--- Plugins
-------------------

local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- FuzzyFinder
Plug('junegunn/fzf.vim')
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

-- RipGrep
Plug('jremmen/vim-ripgrep')

vim.call('plug#end')
