
-- Automatically automatically run :PackerCompile whenever packer.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost core/packer.lua source <afile> | PackerCompile
  augroup end
]])