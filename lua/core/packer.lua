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
  use 'ThePrimeagen/vim-be-good'
end)

-- TODO: swap coc for
-- TODO: swap for nvim-cmp !
