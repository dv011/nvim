--settings for several vim options

vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

--set winbar opt
vim.o.winbar = '%m%=%f'

--set relativenumbers for quick up and down movement
vim.o.relativenumber = true
vim.o.nu = true

--set auto indenting for C programs
vim.o.smartindent = true

--indent for new paragraph
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>o', { noremap = true, silent = true })

--prevents line wrapping
vim.o.wrap = false

--enable text wrapping for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  command = "setlocal wrap textwidth=80 formatoptions+=t"
})

--removes highlighting remaining after use but keeps incremental search
vim.o.hlsearch = false
vim.o.incsearch = true

--all the colors
vim.o.termguicolors = true

--keeps at least 8 lines of code visible when scrolling up
vim.o.scrolloff = 8

--saves to buffer after set amount of time without typing
vim.o.updatetime = 50

--sets color column so I will know when to start a new line
-- vim.o.colorcolumn = "80"

--maps leader key to space key
vim.g.mapleader = " "

-- window management options
vim.o.splitbelow = true

-- save options
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Map <leader>W to the sudo_write function
vim.api.nvim_set_keymap('n', '<leader>W', '<cmd>lua sudo_write()<CR>', { noremap = true, silent = true })

--everything below this is just me testing various things
-- Define custom command to open files from Zettelkasten folder
vim.cmd([[command! -nargs=1 Zet lua OpenZetFile(<f-args>)]])

function OpenZetFile(file)
    local zet_path = '/home/dev/work/Zet/'
vim.o.cursorline = false

    local file_path = zet_path .. file .. '.md'
    if vim.fn.filereadable(file_path) == 1 then
        vim.cmd('edit ' .. file_path)
    else
        vim.api.nvim_err_writeln('File not found: ' .. file_path)
    end
end

-- Open a window Test
vim.cmd([[command! -nargs=1 Winda lua OpenWinda(contents)]])

function OpenWinda(contents)
    local buf = vim.api.nvim_create_buf(false, true)
    local opts = {
        relative = 'editor',
        width = 20,
        height = 10,
        row = 25,
        col = 25,
        style = 'minimal',
        border = 'single',
    }
    local win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, contents)
    return win
end

-- Example usage
-- local floating_contents = {"This is", "a floating", "window"}
-- local floating_window = create_floating_window(floating_contents)
