return {
  'zenbones-theme/zenbones.nvim',
  -- Optionally install Lush. Allows for more configuration or extending the colorscheme.
  dependencies = 'rktjmp/lush.nvim',
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    vim.o.background = 'dark'
    vim.cmd.colorscheme 'duckbones'
  end,
}
