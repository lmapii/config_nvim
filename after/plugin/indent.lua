
-- style the indent lines (they use BlankColor)
vim.api.nvim_set_hl(0, 'BlankColor', {fg='#333333'})

require("indent_blankline").setup {
    char_highlight_list = {
        "BlankColor",
    },
    space_char_highlight_list = {
        "BlankColor",
    },
    -- space_char_blankline = " ",
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
    use_treesitter = true,
    -- show_current_context = true,
    -- show_current_context_start = true,
}
