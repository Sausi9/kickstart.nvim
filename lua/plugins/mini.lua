return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings
    require('mini.surround').setup()

    require('mini.pairs').setup()

    -- Simple statusline
    local statusline = require 'mini.statusline'
    statusline.setup {
      use_icons = vim.g.have_nerd_font,
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode { trunc_width = 120 }
          local filename = '%F%m%r'
          local fileinfo = statusline.section_fileinfo { trunc_width = 120 }
          local location = statusline.section_location { trunc_width = 75 }

          return statusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            -- Reset highlight so mode color doesn't bleed through alignment gaps.
            { hl = 'StatusLine', strings = {} },
            '%<',
            '%=',
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=',
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo, location } },
          }
        end,
      },
    }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
