-- [[ Editor Enhancements ]]
return {
  -- Smooth scrolling
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },

  -- Mini.nvim: collection of small plugins
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings
      require('mini.surround').setup()

      -- Simple statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
    config = function ()
	vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#f97316", bg = "#444444", bold = true })
	vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#f97316", bg = "#444444", bold = true })
    end,
    keys = {
      -- your existing mappings
      {
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      {
        'r',
        mode = 'o',
        function()
          require('flash').remote()
        end,
        desc = 'Remote Flash',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search()
        end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function()
          require('flash').toggle()
        end,
        desc = 'Toggle Flash Search',
      },

      -- 🔥 Helix / HopWord-like "go to word" on gw
      {
        'gw',
        mode = { 'n', 'x', 'o' },
        function()
          local Flash = require 'flash'

          ---@param opts Flash.Format
          local function format(opts)
            -- show 2-char labels
            return {
              { opts.match.label1, 'FlashMatch' },
              { opts.match.label2, 'FlashLabel' },
            }
          end

          Flash.jump {
            search = { mode = 'search' }, -- use Vim's search regex engine
            label = {
              after = false,
              before = { 0, 0 },
              uppercase = false,
              format = format,
            },
            pattern = [[\<]], -- match *word starts*
            action = function(match, state)
              -- first key picked (label1) → narrow down to those matches
              state:hide()
              Flash.jump {
                search = { max_length = 0 }, -- don't read more chars
                highlight = { matches = false },
                label = { format = format },
                matcher = function(win)
                  -- only keep matches with the same first label in this window
                  return vim.tbl_filter(function(m)
                    return m.label == match.label and m.win == win
                  end, state.results)
                end,
                labeler = function(matches)
                  -- now use the second label (label2)
                  for _, m in ipairs(matches) do
                    m.label = m.label2
                  end
                end,
              }
            end,
            labeler = function(matches, state)
              -- assign 2-char labels (label1 + label2)
              local labels = state:labels()
              for i, m in ipairs(matches) do
                m.label1 = labels[math.floor((i - 1) / #labels) + 1]
                m.label2 = labels[(i - 1) % #labels + 1]
                m.label = m.label1
              end
            end,
          }
        end,
        desc = 'Teleportation Jutsu',
      },
    },
  },
}
