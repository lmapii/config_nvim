
local Remap = require("core.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap
local nmap = Remap.nmap

-- nnoremap("<leader>pv", ":Ex<CR>") -- Show netrw
nnoremap("<leader>pv", ":Lex<CR>") -- Show netrw as left column
-- nnoremap("<leader>u", ":UndotreeShow<CR>")

-- https://gist.github.com/ericvanjohnson/079ae871e156054d3779e8f1efd8375d#file-ideavimrc-L5
-- Let me explain, this remap while in visiual mode
-- will delete what is currently highlighted and replace it
-- with what is in the register BUT it will YANK (delete) it
-- to a VOID register. Meaning I still have what I originally had
-- when I pasted. I don't loose the previous thing I YANKED!
xnoremap("<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
-- uses the selection register for the yank and thus preserves *
nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nnoremap("<leader>Y", "\"+Y")

-- don't store in register with dd, for cut, use visual and x instead
nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

-- Disable arrow keys
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

-- Jump to start and end of line using the home row keys
-- For all matching motions (nobody uses H+L https://neovim.io/doc/user/motion.html#H)
nnoremap("H", "^")
vnoremap("H", "^")
xnoremap("H", "^")
onoremap("H", "^")
nnoremap("L", "$")
vnoremap("L", "$")
xnoremap("L", "$")
onoremap("L", "$")

-- There is a subtle difference between <Esc> and <C-c>, see :h i_CTRL-C
-- or https://vi.stackexchange.com/questions/25764/use-control-c-instead-of-escape-key
-- but this is a bad idea since you cannot quit the "q:" buffer anymore
-- TODO: https://github.com/folke/todo-comments.nvim/issues/140
nnoremap("<C-c>", "<Esc>")
vnoremap("<C-c>", "<Esc>")
xnoremap("<C-c>", "<Esc>")
inoremap("<C-c>", "<Esc>")

-- Better window navigation
-- nnoremap("<C-h>", "<C-w>h")
-- vnoremap("<C-j>", "<C-w>j")
-- nnoremap("<C-k>", "<C-w>k") -- used for help
-- vnoremap("<C-l>", "<C-w>l")

-- Resize with arrows
-- Does not work on macos unless desktop switching is changed
-- nnoremap("<C-Up>", ":resize -2<CR>")
-- nnoremap("<C-Down>", ":resize +2<CR>")
-- nnoremap("<C-Left>", ":vertical resize -2<CR>")
-- nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Visual Block --
-- Move text up and down
-- xnoremap("J", ":move '>+1<CR>gv-gv")
-- xnoremap("K", ":move '<-2<CR>gv-gv")
-- xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
-- xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

-- TODO: https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

-- https://stackoverflow.com/questions/4256697/vim-search-and-highlight-but-do-not-jump
-- nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>
-- nnoremap <silent> g* :let @/=expand('<cword>') <bar> set hls <cr>

-- quick navigation for buffers compatible with tpope unimpaired
nnoremap("[b", ":bprevious<CR>")
nnoremap("]b", ":bnext<CR>")
nnoremap("[B", ":bfirst<CR>")
nnoremap("]B", ":blast<CR>")

-- https://github.com/nelstrom/vim-visual-star-search
-- re-write attempt in lua
function _G.set_search(arg, g)
   -- https://github.com/nanotee/nvim-lua-guide#using-vimscript-from-lua
   local tmp = vim.fn.getreg("s")
   -- repeat the current election and yank it into register s
   vim.cmd([[norm! gv"sy]])
   -- https://neovim.io/doc/user/builtin.html#builtin-function-list
   local esc = vim.fn.escape(vim.fn.getreg("s"), arg .. '\\')
   esc = vim.fn.substitute(esc, '\n', '\\n', 'g')
   if g then
     esc = "\\<" .. esc .. "\\>"
   end
   vim.fn.setreg("/", "\\V" .. esc)
   -- instead of restoring the yanked value, keep it for :substitute
   -- but then again instead of substitute use `cgn`
   -- definition of `gn`:
   -- search forward for the last searched pattern and start visual mode to select the match,
   -- if an operator is pending, this operates on the match (allowing dot to repeat the action)
   -- vim.fn.setreg("s", tmp)
   vim.cmd([[set hls]])
end

-- https://vi.stackexchange.com/questions/9751/understanding-ctrl-u-combination
-- vim.keymap.set("x", "*", ':<C-u>lua _G.set_search("/")<CR>/<C-R>=@/<CR><CR>', {silent = true})
-- vim.keymap.set("x", "#", ':<C-u>lua _G.set_search("?")<CR>?<C-R>=@/<CR><CR>', {silent = true})

-- instead of already executing the search, simply preload the "/" register
-- this allows to use "//e" or "?" without a pattern since it is already in the register
vim.keymap.set("x", "*",  ':<C-u>lua _G.set_search("/", false)<CR>', {silent = true})
vim.keymap.set("x", "g*", ':<C-u>lua _G.set_search("/", true )<CR>', {silent = true})
vim.keymap.set("x", "#",  ':<C-u>lua _G.set_search("?", false)<CR>', {silent = true})
vim.keymap.set("x", "g#", ':<C-u>lua _G.set_search("?", true )<CR>', {silent = true})

-- Unset search highlight
vim.keymap.set("n", "<CR>", ":noh<CR><CR>")
