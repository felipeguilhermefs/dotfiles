-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Tokyo Night
  use {
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight')
	  end
  }
end)
