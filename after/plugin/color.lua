-- https://stackoverflow.com/questions/73254591/neovim-color-schemes-fail-on-mac-terminal
-- In summary, Terminal.app doesn't support true colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- https://github.com/ellisonleao/gruvbox.nvim
require("gruvbox").setup({
    contrast = "hard",
    transparent_mode = true,
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

vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme tokyonight]])
-- vim.cmd([[colorscheme solarized]])