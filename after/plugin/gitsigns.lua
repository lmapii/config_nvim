-- these are the defaults from https://github.com/lewis6991/gitsigns.nvim
require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm = {
      enable = false
    },
  }

local Remap = require("core.keymap")
local nnoremap = Remap.nnoremap
-- local vnoremap = Remap.vnoremap
-- local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
-- local nmap = Remap.nmap

local gs = require("gitsigns")

-- Actions
nnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>')
xnoremap('<leader>hs', ':Gitsigns stage_hunk<CR>')
nnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>')
xnoremap('<leader>hr', ':Gitsigns reset_hunk<CR>')
nnoremap('<leader>hS', gs.stage_buffer)
nnoremap('<leader>hu', gs.undo_stage_hunk)
nnoremap('<leader>hR', gs.reset_buffer)
nnoremap('<leader>hp', gs.preview_hunk)
nnoremap('<leader>hb', function() gs.blame_line{full=true} end)
nnoremap('<leader>tb', gs.toggle_current_line_blame)
nnoremap('<leader>hd', gs.diffthis)
nnoremap('<leader>hD', function() gs.diffthis('~') end)
nnoremap('<leader>td', gs.toggle_deleted)

-- Text object
onoremap('<C-U>Gitsigns', 'select_hunk<CR>')
xnoremap('<C-U>Gitsigns', 'select_hunk<CR>')

