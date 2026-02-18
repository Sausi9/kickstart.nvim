return {
  'folke/tokyonight.nvim',
  priority = 1000,
  enabled = false,
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
      },
    }
    -- vim.cmd.colorscheme 'tokyonight-night'
  end,
}
