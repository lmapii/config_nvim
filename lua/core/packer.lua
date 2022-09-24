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
  -- Some color scheme
  use 'folke/tokyonight.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'shaunsingh/solarized.nvim'
  -- Code completion
  use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
  -- Fuzzy finder with telescope
  -- ripgrep is required for live_grep
  use { "junegunn/fzf", run = ":call fzf#install()" }
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  -- A nicer status line
  use 'nvim-lualine/lualine.nvim'
  -- Indentation lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Treelines for code
  use 'nvim-treesitter/nvim-treesitter'
end)