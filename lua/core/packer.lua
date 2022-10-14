-- https://github.com/wbthomason/packer.nvim
-- Allows to use packer commands by using :P<tab> e.g., to sync use :PackerSync
-- Also, a good list with plugins to get started
-- https://vonheikemen.github.io/devlog/tools/neovim-plugins-to-get-started/

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer manages itself
  use { 'wbthomason/packer.nvim' }
  -- The very basics from tpope
  use { 'tpope/vim-unimpaired' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-abolish' }
  use { 'tpope/vim-commentary' }
  -- Some color schemes
  use { 'folke/tokyonight.nvim' }
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'shaunsingh/solarized.nvim' }
  use { 'savq/melange' }
  use { 'Mofiqul/vscode.nvim' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  -- Code completion and language server using coc
  -- Additional lsp's, formatters etc. are installed using :CocInstall
  -- Language servers can be configured using :CocConfig (opens coc-settings.json)
  use {
    'neoclide/coc.nvim',
    branch = 'master',
    run = 'yarn install --frozen-lockfile'
  }
  -- Language server provider (instead of using coc.vim)
  -- Currently used for ltex-ls, should replace coc.nvim in the future
  use { 'neovim/nvim-lspconfig' }
  -- Fuzzy finder with telescope, notice that changing telescope-fzf-native.nvim requires a rebuild
  -- https://github.com/wbthomason/packer.nvim/issues/1006
  -- https://www.reddit.com/r/neovim/comments/pids9o/loading_fzf_in_neovim_initlua/
  -- ripgrep is required for live_grep
  use {
    'junegunn/fzf',
    run = ":call fzf#install()"
  }
  use { 'junegunn/fzf.vim' }
  use { 'nvim-lua/plenary.nvim' }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release'
      .. '&& cmake --build build --config Release '
      .. '&& cmake --install build --prefix build'
  }
  use { 'nvim-telescope/telescope.nvim' }
  -- A nicer status line
  use { 'nvim-lualine/lualine.nvim' }
  -- Indentation lines
  use { 'lukas-reineke/indent-blankline.nvim' }
  -- A simpler treesitter interface, tree-lines for code
  use { 'nvim-treesitter/nvim-treesitter' }
  -- A little VIM trainer/game
  use { 'ThePrimeagen/vim-be-good' }
  -- Visualize color codes
  use { 'NvChad/nvim-colorizer.lua' }
  -- Visual git integration
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  }
  -- Highlight todos, etc.
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
  -- took me 1 minute to break this plugin by block-select then CTRL-n
  -- might be due to the conflict of default <C-n> and <C-p> for the builtin
  -- VIM autocompletion
  -- use 'terryma/vim-multiple-cursors'
end)

-- https://github.com/terrortylor/nvim-comment
-- https://github.com/kyazdani42/nvim-tree.lua
-- https://github.com/nvim-pack/nvim-spectre
-- https://github.com/tpope/vim-fugitive
-- https://github.com/hrsh7th/nvim-cmp

