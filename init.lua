local vim = vim

--------------------
--- Plugins
-------------------

local Plug = vim.fn['plug#']
vim.call('plug#begin')

-- FuzzyFinder
Plug('junegunn/fzf', { ['do'] = function()
  vim.fn['fzf#install']()
end })

vim.call('plug#end')
