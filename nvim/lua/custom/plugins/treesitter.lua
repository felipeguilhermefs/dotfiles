-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'json',
      'lua',
      'luap',
      'luadoc',
      'markdown',
      'markdown_inline',
      'sql',
      'vim',
      'vimdoc',
      'yaml',
      'zig',
    },
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
  },
}
