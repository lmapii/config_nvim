-- https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/keymap.lua
-- remap works recursively
-- noremap works non-recursively

local M = {}

local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

M.nmap = bind("n", {noremap = false})
M.nnoremap = bind("n") -- normal mode only
M.vnoremap = bind("v") -- visual mode and select
M.xnoremap = bind("x") -- visual mode only
M.inoremap = bind("i") -- insert
M.onoremap = bind("o") -- operator-pending

return M