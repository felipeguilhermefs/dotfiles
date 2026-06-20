return { -- QoL plugins
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = {
      enabled = true,
      notify = true, -- show notification when big file detected
      size = 200 * 1024, -- 200KB
    },
    indent = { enabled = true },
    picker = { enabled = true },
    profiler = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
  },
  keys = {
    -- Focus
    { '<leader>fe', function() Snacks.dim.enable() end, desc = '> [F]ocus [E]nable' },
    { '<leader>fd', function() Snacks.dim.disable() end, desc = '> [F]ocus [D]isable' },
    -- Files
    { '<leader>sf', function() Snacks.picker.files() end, desc = '> [S]earch [F]iles' },
    { '<leader>sb', function() Snacks.picker.buffers() end, desc = '> [S]earch in [B]uffers' },
    { '<leader>sp', function() Snacks.picker.projects() end, desc = '> [S]earch in [P]roject' },
    { '<leader>sr', function() Snacks.picker.recent() end, desc = '> [S]earch [R]ecent Files' },
    { '<leader>sc', function() Snacks.picker.files { cwd = vim.fn.stdpath 'config' } end, desc = '> [S]earch [Config] Files' },
    -- Grep
    { '<leader>sG', function() Snacks.picker.grep() end, desc = '> [S]earch by [G]rep' },
    { '<leader>sg', function() Snacks.picker.grep_buffers() end, desc = '> [S]earch by [g]rep on Buffers' },
    { '<leader>/', function() Snacks.picker.lines() end, desc = '> [/] Fuzzy find in current buffer' },
    -- Search
    { '<leader>sh', function() Snacks.picker.help() end, desc = '> [S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '> [S]earch [K]eymaps' },
    { '<leader>sq', function() Snacks.picker.qflist() end, desc = '> [S]earch [Q]uickfix List' },
    { '<leader>sm', function() Snacks.picker.marks() end, desc = '> [S]earch [M]arks' },
    { '<leader>st', function() Snacks.picker.todo_comments() end, desc = '> [S]earch [T]odo Comments' },
    -- Git
    { '<leader>gb', function() Snacks.picker.git_branches() end, desc = "> [G]it [B]ranches" },
    { '<leader>gl', function() Snacks.picker.git_log() end, desc = "> [G]it [L]og" },
    { '<leader>gs', function() Snacks.picker.git_status() end, desc = "> [G]it [s]tatus" },
    { '<leader>gS', function() Snacks.picker.git_stash() end, desc = "> [G]it [S]tash" },
    { '<leader>gd', function() Snacks.picker.git_diff() end, desc = "> [G]it [D]iff (Hunks)" },
    { '<leader>gf', function() Snacks.picker.git_log_file() end, desc = "> [G]it Log [F]ile" },
    -- LSP
    { 'gd', function() Snacks.picker.lsp_definitions() end, desc = '[g]oto [d]efinition' },
    { 'gr', function() Snacks.picker.lsp_references() end, nowait = true, desc = '[g]oto [r]eferences' },
    { 'gD', function() Snacks.picker.lsp_declarations() end, desc = '[g]oto [D]eclaration' },
    { 'gi', function() Snacks.picker.lsp_implementations() end, desc = '[g]oto [i]mplementation' },
    { '<leader>D', function() Snacks.picker.lsp_type_definitions() end, desc = 'Type [D]efinition' },
    { '<leader>ds', function() Snacks.picker.lsp_symbols() end, desc = '[d]ocument [s]ymbols' },
    { '<leader>ws', function() Snacks.picker.lsp_workspace_symbols() end, desc = '[w]orkspace [s]ymbols' },
  },
}
