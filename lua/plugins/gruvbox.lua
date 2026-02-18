return {
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
}
