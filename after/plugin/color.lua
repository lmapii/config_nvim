-- https://stackoverflow.com/questions/73254591/neovim-color-schemes-fail-on-mac-terminal
-- In summary, Terminal.app doesn't support true colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- https://github.com/ellisonleao/gruvbox.nvim
require("gruvbox").setup({
    contrast = "hard",
    transparent_mode = true,
    palette_overrides = {
      bright_red = "#AF7F0A",
      bright_orange = "#F4883F",
      neutral_red = "#B7490A",
      faded_red = "#9F371A",
      faded_orange = "#E5711E",
    }
  })

-- https://github.com/norcalli/nvim-colorizer.lua
require("colorizer").setup({
  user_default_options = {
    names = false -- "Name" codes like Blue or blue
  }
})

-- https://github.com/folke/tokyonight.nvim
require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
      sidebars = "transparent", -- style for sidebars, see below
    }
  })

-- https://github.com/Mofiqul/vscode.nvim
require('vscode').setup({
  transparent = true,
  italic_comments = false,
  disable_nvimtree_bg = true,
})

-- https://github.com/catppuccin/nvim
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require('catppuccin').setup({
  transparent_background = false, -- if true, disables setting the background color
})

-- vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme solarized]])
-- vim.cmd([[colorscheme melange]])
-- vim.cmd([[colorscheme vscode]])
vim.cmd([[colorscheme catppuccin]])

-- adapt the code completion plugin to the color scheme
vim.api.nvim_set_hl(0, 'CocErrorSign', {fg='#d1666a'})
vim.api.nvim_set_hl(0, 'CocInlayHint', {fg='#333333', bg='#000000'})

