-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
-- https://github.com/nanotee/nvim-lua-guide
-- https://neovim.io/doc/user/options.html

print("loading settings")

local g = vim.g             -- Global variables
local opt = vim.opt         -- Set options (global/buffer/windows-scoped)

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- opt.guicursor = ""          -- Keep cursor fat
opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor"
opt.errorbells = false      -- No thank you. No error bell for error messages
opt.mouse = 'a'             -- Enable mouse support (all modes)
opt.showmatch = true        -- Highlight matching parenthesis
opt.relativenumber = true   -- Relative line numbers
opt.nu = true               -- Also show current absolute line
opt.colorcolumn = '80'      -- Line lenght marker at 80 columns

opt.backspace = 'indent,eol,start' -- Backspace over newlines
opt.splitright = true              -- Vertical split to the right
opt.splitbelow = true              -- Horizontal split to the bottom
opt.laststatus = 3                 -- Set global statusline (always and ONLY the last)
-- opt.laststatus = 2                 -- Set global statusline (always and all windows)
-- opt.showmode = false               -- Hide Insert/Replace/Visual mode display
opt.showcmd = true                 -- Show (partial) command in status line.
opt.shortmess:append { c = true }  -- Don't give |ins-completion-menu| messages.
opt.foldenable = false             -- Don't use folding

-- http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
-- Decreas open delay, affects leader key
opt.timeoutlen = 300

opt.encoding = "utf-8"  -- Default editor encoding
opt.scrolloff = 8       -- Minimal number of screen lines to keep above and below the cursor
opt.wrap = false        -- Do not automatically wrap text
opt.signcolumn = "yes"  -- Always draw sign column

-- Decent wildmenu
opt.wildmenu = true
opt.wildmode = "list:longest"
opt.wildignore = ".hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Show hidden characters
-- Verbose: opt.listchars = nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
opt.listchars = 'nbsp:¬,eol:¶,extends:»,precedes:«,trail:•'
-- Additional charaters
opt.list = true
-- opt.listchars:append "eol:↓,space:⋅"
opt.listchars:append "eol:↓"

opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.gdefault = true
opt.incsearch = true
opt.hlsearch = false

-- Completion
-- Better completion
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt = 'menuone,noinsert,noselect'

--https://github.com/vim/vim/issues/1735#issuecomment-383353563
opt.ttyfast = true
opt.lazyredraw = true
opt.synmaxcol = 500

-- Make diffing better: https://vimways.org/2018/the-power-of-diff/
-- And no whitespace in vimdiff
opt.diffopt:append {
    "iwhite",
    "algorithm:patience",
    "indent-heuristic"
}

-- Wrapping options
-- tc -- wrap text and comments using textwidth
-- r  -- continue comments when pressing ENTER in I mode
-- q  -- enable formatting of comments with gq
-- n  -- detect lists for formatting
-- b  -- auto-wrap in insert mode, and do not wrap old long lines
opt.formatoptions = "tcrqnb"

-- Leader key is space instead of always having to type ":"
g.mapleader = " "

-- TODO: check to disable normal plugins
-- https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
