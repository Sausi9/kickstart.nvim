return {
  -- LaTeX snippets
  {
    'iurimateus/luasnip-latex-snippets.nvim',
    dependencies = { 'L3MON4D3/LuaSnip' },
    config = function()
      require('luasnip-latex-snippets').setup()
    end,
  },
}
