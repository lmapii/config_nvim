-- https://www.reddit.com/r/neovim/comments/nd7y73/my_thoughts_on_nvimlsp_vs_coc_with_rust/
-- https://smarttech101.com/nvim-lsp-diagnostics-keybindings-signs-virtual-texts/
vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]

local signs = { Error = "• ", Warn = "•", Hint = "•", Info = "•" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- https://www.reddit.com/r/neovim/comments/sdvfwr/full_diagnostic_for_grammarly_language_server_in/
-- https://www.reddit.com/r/neovim/comments/s24zvh/how_can_i_load_a_user_dictionary_into_ltexls/
local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

require'lspconfig'.ltex.setup{
  settings = {
    ltex = {
      disabledRules = {
        ['en'] = { 'PROFANITY' },
        ['en-US'] = { 'PROFANITY' },
        ['en-GB'] = { 'PROFANITY' },
      },
      dictionary = {
        ['en'] = words,
        ['en-US'] = words,
        ['en-GB'] = words,
      },
    }
  }
}
