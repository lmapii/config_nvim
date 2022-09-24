
require('nvim-treesitter.configs').setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    ensure_installed = {
      'javascript',
      'typescript',
      'tsx',
      'css',
      'json',
      'lua',
      'cmake',
      'c',
      'cpp',
      'go',
      'rust',
      'dockerfile',
    },
})
