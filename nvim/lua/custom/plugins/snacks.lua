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
    profiler = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
  },
  keys = {
    {
      '<leader>fe',
      function()
        Snacks.dim.enable()
      end,
      desc = '[F]ocus [E]nable',
    },
    {
      '<leader>fd',
      function()
        Snacks.dim.disable()
      end,
      desc = '[F]ocus [D]isable',
    },
  },
}
