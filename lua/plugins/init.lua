-- [[ Plugin Specifications ]]
-- This file aggregates all plugin specs from the plugins/ directory
-- Each file in plugins/ returns a table (or array of tables) with plugin specs

return {
  -- Load all plugin modules
  { import = 'plugins.colorscheme' },
  { import = 'plugins.telescope' },
  { import = 'plugins.treesitter' },
  { import = 'plugins.lsp' },
  { import = 'plugins.completion' },
  { import = 'plugins.ui' },
  { import = 'plugins.editor' },
  { import = 'plugins.yazi' },
}
