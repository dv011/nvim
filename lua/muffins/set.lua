--settings for several options

local o = vim.o
local g = vim.g

--maps leader key to space key
g.mapleader = " "
g.maplocalleader = " "

-- MISCELLANEOUS OPTIONS
--change dir when switching files, buffers, etc
o.autochdir = true
--remove status bar when usng multiple windows
o.laststatus = 0
--enable more terminal colors
o.termguicolors = true
--saves to buffer after set amount of time without typing
o.updatetime = 50

-- SAVE OPTIONS
o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- SEARCH OPTIONS
--removes highlighting remaining on words after searching but keeps incremental
--search
o.hlsearch = false
o.incsearch = true

--TEXT FORMAT OPTIONS
--take indent for new line from previous line
o.autoindent = true
--preserve indent at beginning of line for wrapped text e.g. markdown/notes
o.breakindent = true
--show 2 space tabs for me but keep default 8 for the rest of the world
o.expandtab = false
--only used for shifting text left or right
o.shiftwidth = 2
--set auto indenting for c programs
o.smartindent = true
--adds space to left margin for symbols
o.signcolumn = "yes:1"
--sets tabs to 2 for me and keeps standard 8 for everyone else
o.softtabstop = 2
--prevents long lines from wrapping visually, add line breaks for wrapping
--instead
o.wrap = false
--wraps text after column 80
o.wrapmargin = 80

--UI OPTIONS
--sets color column so i will know when to start a new line
o.colorcolumn = "80"
--sets conceallevel for neorg to remove @code @end
o.conceallevel = 2
--prevents auto folding in neorg
o.foldlevel = 99
--line number options
-- show current line number instead of zero
o.number = true
--set relativenumbers for quick up and down movement
o.relativenumber = true
--keeps 8 next lines of code visible when scrolling up/down
o.scrolloff = 8
--set winbar to left adjusted "[+] path/to/file"
--%-m is for the left adjusted [+]
--%-=%F is for the left adjusted path/to/file
-- o.winbar = "%-m %-=%F"
--show changes in quickfix list before applying
o.inccommand = "split"

--YANK OPTIONS
o.clipboard = "unnamedplus"

---- TODO: fix this to get linting to work without sending out errors for other
----filetypes
----this is currently commented out because I kept getting a BufWritePost error
----when saving with markdown files
----enable linting
--autocmd({ "BufWritePost" }, {
--	callback = function()
--		-- try_lint without arguments runs the linters defined in `linters_by_ft`
--		-- for the current filetype
--		require("lint").try_lint()
--	end,
--})
