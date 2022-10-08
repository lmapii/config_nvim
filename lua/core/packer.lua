-- https://github.com/wbthomason/packer.nvim
-- Allows to use packer commands by using :P<tab> e.g., to sync use :PackerSync
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Also, a good list with plugins to get started
-- https://vonheikemen.github.io/devlog/tools/neovim-plugins-to-get-started/

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Some color schemes
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'shaunsingh/solarized.nvim'
  use 'savq/melange'
  use 'Mofiqul/vscode.nvim'
  use { 'catppuccin/nvim', as = 'catppuccin' }
  -- Code completion
  use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  -- Fuzzy finder with telescope, notice that changing telescope-fzf-native.nvim requires a rebuild (see 1006)
  -- https://www.reddit.com/r/neovim/comments/pids9o/loading_fzf_in_neovim_initlua/
  -- https://github.com/wbthomason/packer.nvim/issues/1006
  -- ripgrep is required for live_grep
  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use { 'junegunn/fzf.vim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use { 'nvim-telescope/telescope.nvim' }
  -- A nicer status line
  use 'nvim-lualine/lualine.nvim'
  -- Indentation lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Treelines for code
  use 'nvim-treesitter/nvim-treesitter'
  -- A little VIM trainer/game
  use 'ThePrimeagen/vim-be-good'
  -- color codes to color
  use 'NvChad/nvim-colorizer.lua'
  -- visual git integration
  use {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
  }
  -- tpope!
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'tpope/vim-abolish'
  use 'tpope/vim-commentary'
  -- highlight todos, etc.
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
  }
end)

-- TODO: check nvim-cmp vs. coc, vim-rooter
-- https://github.com/terrortylor/nvim-comment
-- https://github.com/kyazdani42/nvim-tree.lua
-- https://github.com/nvim-pack/nvim-spectre
-- https://github.com/tpope/vim-fugitive
