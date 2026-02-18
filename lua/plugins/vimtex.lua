return {
  -- LaTeX plugin
  {
    'lervag/vimtex',
    lazy = false, -- vimtex needs to load on startup for some features
    init = function()
      -- General vimtex settings
      --
      vim.cmd 'filetype plugin indent on'
      vim.g.vimtex_view_enabled = 1
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_view_general_options = '@pdf'
      vim.g.vimtex_compiler_method = 'latexmk' -- default, works well

      -- Do not use built-in mappings if you want to make your own
      -- vim.g.vimtex_mappings_enabled = 0

      -- If you want conceal (pretty symbols)
      vim.g.tex_conceal = 'abdmg'
      vim.wo.conceallevel = 2
    end,
  },
}
