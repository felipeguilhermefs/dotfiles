local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', builtin.git_files, {})

vim.keymap.set('n', '<leader>O', builtin.find_files, {})

vim.keymap.set('n', '<leader>f', builtin.live_grep, {})

vim.keymap.set('n', '<leader>c', builtin.colorscheme, {})
