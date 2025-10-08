-- Zed Gruvbox Material Theme Configuration
-- Based on tokiory/zed-gruvbox-material color palette

-- Set up the base gruvbox-material theme
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_transparent_background = 0
vim.g.gruvbox_material_ui_contrast = 'high'

-- Apply the base theme
vim.cmd.colorscheme 'gruvbox-material'

-- Custom highlights to match Zed's Gruvbox Material theme
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'gruvbox-material',
  callback = function()
    -- Get the background color from gruvbox-material theme
    local bg_color = vim.fn.synIDattr(vim.fn.hlID 'Normal', 'bg')
    -- Ensure we have a valid hex color
    if not bg_color or bg_color == '' or not bg_color:match '^#' then
      bg_color = '#282828' -- Fallback to gruvbox bg
    end

    -- Color palette from Zed's Gruvbox Material theme
    local colors = {
      -- Background colors
      bg = bg_color,
      surface = bg_color,
      elevated_surface = '#3c3836',
      element_bg = bg_color,
      element_hover = '#3c3836',
      element_active = '#45403d',
      element_selected = '#504945',

      -- Foreground colors
      fg = '#d4be98',
      fg_muted = '#c5b18d',
      fg_disabled = '#928374',

      -- Accent and UI colors
      accent = '#7daea3',
      border = '#504945',
      border_variant = bg_color,
      line_number = '#7c6f64',
      active_line = '#3c3836',
      highlighted_line = '#45403d',
      search_match = '#504945',

      -- Syntax colors
      red = '#ea6962',
      green = '#a9b665',
      yellow = '#d8a657',
      blue = '#7daea3',
      purple = '#d3869b',
      cyan = '#89b482',
      orange = '#e78a4e',

      -- Status and semantic colors
      error = '#ea6962',
      warning = '#d8a657',
      info = '#7daea3',
      hint = '#68948a',
      success = '#a9b665',

      -- Comment colors
      comment = '#7c6f64',
      comment_doc = '#928374',

      -- Terminal colors
      term_black = '#292828',
      term_red = '#ea6962',
      term_green = '#a9b665',
      term_yellow = '#d8a657',
      term_blue = '#7daea3',
      term_magenta = '#d3869b',
      term_cyan = '#89b482',
      term_white = '#d4be98',
      term_bright_black = '#5a524c',
    }

    -- Set terminal colors
    vim.g.terminal_color_0 = colors.term_black
    vim.g.terminal_color_1 = colors.term_red
    vim.g.terminal_color_2 = colors.term_green
    vim.g.terminal_color_3 = colors.term_yellow
    vim.g.terminal_color_4 = colors.term_blue
    vim.g.terminal_color_5 = colors.term_magenta
    vim.g.terminal_color_6 = colors.term_cyan
    vim.g.terminal_color_7 = colors.term_white
    vim.g.terminal_color_8 = colors.term_bright_black
    vim.g.terminal_color_9 = colors.term_red
    vim.g.terminal_color_10 = colors.term_green
    vim.g.terminal_color_11 = colors.term_yellow
    vim.g.terminal_color_12 = colors.term_blue
    vim.g.terminal_color_13 = colors.term_magenta
    vim.g.terminal_color_14 = colors.term_cyan
    vim.g.terminal_color_15 = colors.term_white

    -- Custom highlights
    local highlights = {
      -- Editor base
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalFloat = { fg = colors.fg, bg = colors.elevated_surface },
      NormalNC = { fg = colors.fg, bg = colors.bg },

      -- Cursor and lines
      CursorLine = { bg = colors.active_line },
      CursorColumn = { bg = colors.active_line },
      LineNr = { fg = colors.line_number, bg = colors.bg },
      CursorLineNr = { fg = colors.fg, bg = colors.active_line },

      -- Visual selection
      Visual = { bg = colors.element_selected },
      VisualNOS = { bg = colors.element_selected },

      -- Search
      Search = { bg = colors.search_match },
      IncSearch = { fg = colors.bg, bg = colors.yellow },
      CurSearch = { fg = colors.bg, bg = colors.orange },

      -- Syntax highlighting
      Comment = { fg = colors.comment, italic = true },

      -- Keywords and control flow
      Keyword = { fg = colors.blue, italic = true },
      Conditional = { fg = colors.blue, italic = true },
      Repeat = { fg = colors.blue, italic = true },
      Statement = { fg = colors.blue, italic = true },
      Include = { fg = colors.blue, italic = true },

      -- Functions and methods
      Function = { fg = colors.cyan },
      ['@function'] = { fg = colors.cyan },
      ['@method'] = { fg = colors.cyan },
      ['@function.call'] = { fg = colors.cyan },
      ['@function.builtin'] = { fg = colors.cyan },

      -- Types and constructors
      Type = { fg = colors.cyan },
      ['@type'] = { fg = colors.cyan },
      ['@type.builtin'] = { fg = colors.cyan },
      ['@constructor'] = { fg = colors.cyan },
      StorageClass = { fg = colors.cyan },
      Structure = { fg = colors.cyan },
      Typedef = { fg = colors.cyan },

      -- Variables and identifiers
      Identifier = { fg = colors.fg },
      ['@variable'] = { fg = colors.fg },
      ['@parameter'] = { fg = colors.fg },

      -- Properties and fields
      ['@property'] = { fg = colors.red },
      ['@field'] = { fg = colors.red },

      -- Strings
      String = { fg = colors.green },
      ['@string'] = { fg = colors.green },
      ['@string.escape'] = { fg = colors.fg_disabled },
      ['@string.regex'] = { fg = colors.purple },
      ['@string.special'] = { fg = colors.purple },

      -- Numbers and booleans
      Number = { fg = colors.purple },
      Boolean = { fg = colors.purple },
      ['@boolean'] = { fg = colors.purple },
      ['@number'] = { fg = colors.purple },
      Float = { fg = colors.purple },

      -- Constants
      Constant = { fg = colors.purple },
      ['@constant'] = { fg = colors.purple },
      ['@constant.builtin'] = { fg = colors.purple },

      -- Operators and punctuation
      Operator = { fg = colors.cyan },
      ['@operator'] = { fg = colors.cyan },
      Delimiter = { fg = colors.fg_muted },
      ['@punctuation.delimiter'] = { fg = colors.fg_muted },
      ['@punctuation.bracket'] = { fg = colors.fg_muted },
      ['@punctuation.special'] = { fg = colors.fg_muted },

      -- Tags and attributes
      Tag = { fg = colors.blue },
      ['@tag'] = { fg = colors.blue },
      ['@tag.attribute'] = { fg = colors.blue },
      ['@attribute'] = { fg = colors.blue },

      -- Emphasis and titles
      ['@text.title'] = { fg = colors.red },
      ['@text.emphasis'] = { fg = colors.blue },
      ['@text.strong'] = { fg = colors.purple, bold = true },
      ['@text.literal'] = { fg = colors.green },
      Title = { fg = colors.red },

      -- Special variables
      ['@variable.builtin'] = { fg = colors.purple },
      Special = { fg = colors.purple },
      SpecialChar = { fg = colors.purple },

      -- Enums
      ['@lsp.type.enum'] = { fg = colors.red },
      ['@lsp.type.enumMember'] = { fg = colors.red },

      -- Labels
      Label = { fg = colors.blue },
      ['@label'] = { fg = colors.blue },

      -- Preprocessor
      PreProc = { fg = colors.fg },
      ['@preproc'] = { fg = colors.fg },
      Define = { fg = colors.fg },
      Macro = { fg = colors.fg },

      -- Documentation comments
      ['@comment.documentation'] = { fg = colors.comment_doc, italic = true, bold = true },
      SpecialComment = { fg = colors.comment_doc, italic = true, bold = true },

      -- UI Elements
      StatusLine = { fg = colors.fg, bg = colors.bg },
      StatusLineNC = { fg = colors.fg_muted, bg = colors.bg },
      TabLine = { fg = colors.fg_muted, bg = colors.bg },
      TabLineFill = { fg = colors.fg_muted, bg = colors.bg },
      TabLineSel = { fg = colors.fg, bg = colors.elevated_surface },

      -- Popup menu
      Pmenu = { fg = colors.fg, bg = colors.elevated_surface },
      PmenuSel = { fg = colors.fg, bg = colors.element_selected },
      PmenuSbar = { bg = colors.element_hover },
      PmenuThumb = { bg = colors.border },

      -- Borders and separators
      VertSplit = { fg = colors.border },
      WinSeparator = { fg = colors.border },
      FloatBorder = { fg = colors.border, bg = colors.elevated_surface },

      -- Diagnostics
      DiagnosticError = { fg = colors.error },
      DiagnosticWarn = { fg = colors.warning },
      DiagnosticInfo = { fg = colors.info },
      DiagnosticHint = { fg = colors.hint },

      -- Git signs
      DiffAdd = { fg = colors.success },
      DiffChange = { fg = colors.warning },
      DiffDelete = { fg = colors.error },
      GitSignsAdd = { fg = colors.success },
      GitSignsChange = { fg = colors.warning },
      GitSignsDelete = { fg = colors.error },

      -- Folds
      Folded = { fg = colors.fg_muted, bg = colors.element_hover },
      FoldColumn = { fg = colors.fg_muted, bg = colors.bg },

      -- Other UI elements
      MatchParen = { fg = colors.orange, bold = true },
      Whitespace = { fg = colors.fg_disabled },
      NonText = { fg = colors.fg_disabled },
      SpecialKey = { fg = colors.fg_disabled },

      -- Spell checking
      SpellBad = { fg = colors.error, underline = true },
      SpellCap = { fg = colors.warning, underline = true },
      SpellLocal = { fg = colors.info, underline = true },
      SpellRare = { fg = colors.hint, underline = true },

      -- Terminal
      Terminal = { fg = colors.fg, bg = colors.bg },
    }

    -- Apply all the custom highlights
    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
})

-- Auto-apply theme on background changes
vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    vim.cmd 'colorscheme gruvbox-material'
  end,
})

-- Apply the theme immediately
vim.schedule(function()
  vim.cmd 'colorscheme gruvbox-material'
end)
