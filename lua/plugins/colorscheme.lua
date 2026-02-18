-- [[ Colorscheme Plugins ]]
return {
  -- Gruvbox Material (active)
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    enabled = true,
    config = function()
      vim.cmd.colorscheme 'gruvbox-material'
      -- require 'themes.gruvbox-material'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd.colorscheme 'gruvbox'

      -- Make sign column, line numbers, folds match Normal background
      vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE' })
      vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'NONE' })
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
  {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    enabled = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'duckbones'
    end,
  },
}
