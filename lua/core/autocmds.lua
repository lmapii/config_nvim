-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/autocmds.lua

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- -- Don't auto comment new lines
-- autocmd('BufEnter', {
--   pattern = '*',
--   command = 'set fo-=c fo-=r fo-=o'
-- })

-- Common settings for filetypes:
-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
-- This exists in addition to the ftplugin files which override these settings
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua', 'json'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- Hide the statusline for fuzzy search with fzf
-- https://github.com/junegunn/fzf/blob/master/README-VIM.md#hide-statusline
-- let g:fzf_layout = { 'down': '30%' }
-- autocmd('FileType', {
--     pattern = 'fzf',
--     command = 'set laststatus=0 noshowmode noruler'
--   })
-- autocmd('BufLeave', {
--   pattern = 'fzf',
--   command = 'set laststatus=2 showmode ruler'
-- })

