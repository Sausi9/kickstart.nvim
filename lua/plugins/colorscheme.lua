-- [[ Colorscheme Plugins ]]
return {
  -- Gruvbox Material (active)
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      require 'themes.gruvbox-material'
    end,
  },

  -- Tokyo Night (inactive)
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    enabled = false, -- Disabled since we're using gruvbox-material
    config = function()
      require('tokyonight').setup {
        styles = {
          comments = { italic = false },
        },
      }
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
