return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {},
  config = function()
    vim.api.nvim_set_hl(0, 'FlashLabel', { fg = '#f97316', bg = '#444444', bold = true })
    vim.api.nvim_set_hl(0, 'FlashMatch', { fg = '#f97316', bg = '#444444', bold = true })
  end,
  keys = {
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
    {
      'gw',
      mode = { 'n', 'x', 'o' },
      function()
        local Flash = require 'flash'

        ---@param opts Flash.Format
        local function format(opts)
          return {
            { opts.match.label1, 'FlashMatch' },
            { opts.match.label2, 'FlashLabel' },
          }
        end

        Flash.jump {
          search = { mode = 'search' },
          label = {
            after = false,
            before = { 0, 0 },
            uppercase = false,
            format = format,
          },
          pattern = [[\<]],
          action = function(match, state)
            state:hide()
            Flash.jump {
              search = { max_length = 0 },
              highlight = { matches = false },
              label = { format = format },
              matcher = function(win)
                return vim.tbl_filter(function(m)
                  return m.label == match.label and m.win == win
                end, state.results)
              end,
              labeler = function(matches)
                for _, m in ipairs(matches) do
                  m.label = m.label2
                end
              end,
            }
          end,
          labeler = function(matches, state)
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
}
