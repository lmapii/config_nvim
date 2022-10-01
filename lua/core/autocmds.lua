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

-- -- Don't auto commenting new lines
-- autocmd('BufEnter', {
--   pattern = '*',
--   command = 'set fo-=c fo-=r fo-=o'
-- })

-- Settings for filetypes:
-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua'
  },
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- -- Terminal settings:
-- -- Open a Terminal on the right tab
-- autocmd('CmdlineEnter', {
--   command = 'command! Term :botright vsplit term://$SHELL'
-- })

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
  command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
  pattern = '*',
  command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
  pattern = 'term://*',
  command = 'stopinsert'
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

-- deprecated: use autocmd
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "json",
-- 	command = "setlocal shiftwidth=2 tabstop=2"
-- })

-- TODO: No autocomplete in empty buffers
-- TODO: No autocomplete in comments
-- vim.api.nvim_create_autocmd("BufRead,BufNewFile", {
-- 	pattern = "/tmp/mutt*",
-- 	command = "let b:coc_enabled = 0"
-- })
