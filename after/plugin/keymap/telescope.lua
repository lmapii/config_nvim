
local Remap = require("core.keymap")
local nnoremap = Remap.nnoremap

-- nnoremap("<leader>pv", ":Ex<CR>")
-- vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
-- vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
-- vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
-- vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
-- vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')

nnoremap("<C-p>", ":Telescope")
nnoremap("<leader>ff", function() require('telescope.builtin').find_files() end)
nnoremap("<leader>fg", function() require('telescope.builtin').live_grep()  end)
nnoremap("<leader>fb", function() require('telescope.builtin').buffers()    end)
nnoremap("<leader>fh", function() require('telescope.builtin').help_tags()  end)
nnoremap("<leader>fs", function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})  end)
nnoremap("<leader>fw", function() require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>")})     end)

require('telescope').load_extension('fzf')

-- nnoremap("<leader>ps", function()
--     require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
-- end)
-- nnoremap("<C-p>", function()
--     require('telescope.builtin').git_files()
-- end)
-- nnoremap("<Leader>pf", function()
--     require('telescope.builtin').find_files()
-- end)

-- nnoremap("<leader>pw", function()
--     require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
-- end)
-- nnoremap("<leader>pb", function()
--     require('telescope.builtin').buffers()
-- end)
-- nnoremap("<leader>vh", function()
--     require('telescope.builtin').help_tags()
-- end)

-- For when you need to change your nvim config fast.
function SearchDotfiles()
    builtin.find_files({
        prompt_title = "Dotfiles",
        theme = themes.get_dropdown{},
        cwd = "~/.config",
        search_dirs = { "nvim" }
    })
end

vim.keymap.set("n", "<leader><leader>d", SearchDotfiles, { silent = true });