-- [[ Lean Language Support ]]
return {
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
  },

  ---@type lean.Config
  opts = {
    mappings = true,
  },
}
