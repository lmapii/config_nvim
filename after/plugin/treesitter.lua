
require('nvim-treesitter.configs').setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    -- ensure_installed = "all",
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
    -- textobjects = {
    --     move = {
    --         enable = true,
    --         set_jumps = true,
    --         goto_next_start = {
    --             ["<leader>c"] = "@comment.outer",
    --         },
    --         goto_previous_start = {
    --             ["<leader>C"] = "@comment.outer",
    --         },
    --     }
    -- },
})
