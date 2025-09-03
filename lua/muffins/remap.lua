local map = vim.keymap.set

map({ "n" }, "<leader>cc", ":silent ! cmus-play-pause-toggle.sh<CR>", { desc = "cmus play pause toggle" })
map({ "n" }, "<leader>nn", ":silent ! cmus-remote --next<CR>", { desc = "cmus next" })
map({ "n" }, "<leader>pp", ":silent ! cmus-remote --prev<CR>", { desc = "cmus prev" })
map({ "n" }, "<leader>sm", ":silent ! cmus-remote --shuffle<CR>", { desc = "cmus shuffle music" })
map({ "n" }, "<leader>vvh", ":silent ! cmus-cmus-set-volume-max.sh<CR>", { desc = "cmus volume max" })
map({ "n" }, "<leader>vvm", ":silent ! cmus-cmus-set-volume-medium.sh<CR>", { desc = "cmus volume medium" })
map({ "n" }, "<leader>vvl", ":silent ! cmus-cmus-set-volume-low.sh<CR>", { desc = "cmus volume low" })

--map('n', '<leader>jf', vim.cmd.Ex, { desc = "Open Netrw" })
map("n", "<leader>jf", ":Oil<CR>", { desc = "Open Oil" })

map({ "n", "v" }, ";", ":", { desc = "enter command mode" })

map("n", "<leader>we", ":w<CR>:!!<CR>", { desc = "e for evaluate, rerun previous bash command" })

map("n", "<leader>en", ":! ", { desc = "enter terminal mode" })

map("n", "<leader>ws", ":w<CR>", { desc = "save file" })

map("n", "<leader>wq", ":wq<CR>", { desc = "save and quit" })

map("n", "<leader>qq", ":q<CR>", { desc = "save and quit" })

map("n", "<leader>rq", ":q!<CR>", { desc = "rage quit" })

map("n", "<leader>W", ":SudaWrite <CR>", { desc = "sudo save file" })

map("n", "<leader>gw", "vapgw{w", { desc = "wrap paragraph" })

map("n", "<leader>Gw", "ggVGgwgg", { desc = "wrap buffer" })

map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>", { desc = "tmux-sessionizer" })

--  TODO: this keymap should return to the initial cursor location see <leader>es
map("n", "g=", "gg=G", { desc = "fix indenting for entire file" })

-- these are disabled while I am trying out neorg for notes
-- map("n", "<leader><leader>n", ":MindOpenProject <CR>", { desc = "open mind notes" })
-- map("n", "<leader><leader>q", ":MindClose <CR>", { desc = "close mind notes" })
--

map("n", "<leader>l", ":Lazy <CR>", { desc = "open lazy" })

map("n", "<leader>m", ":Mason <CR>", { desc = "open mason" })

map("n", "<c-k>", "<c-w>k", { desc = "move to window above" })
map("n", "<c-j>", "<c-w>j", { desc = "move to window below" })
map("n", "<c-h>", "<c-w>h", { desc = "move to window left" })
map("n", "<c-l>", "<c-w>l", { desc = "move to window right" })

map("n", "L", ":wincmd L", { desc = "move to window right window" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selected text up" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "yank highlighted to system clipboard or yy to yank line" })
map("n", "<leader>Y", [["+Y]], { desc = "yank current line to system clipboard" })

map("n", "<C-d>", "<C-d>zz", { desc = "keep cursor in middle of page while jumping down" })
map("n", "<C-u>", "<C-u>zz", { desc = "keep cursor in middle of page while jumping up" })

--telescope keys
map(
  "n",
  "<leader>tf",
  ":lua require('telescope.builtin').lsp_document_symbols({ symbols='function' }) <CR>",
  { desc = "telescope search for functions" }
)

map("n", "<leader>?", ":Telescope keymaps <CR>", { desc = "telescope search for keymaps" })

map("n", "<leader><leader>[", ":Precognition peek <CR>", { desc = "toggle precognition" })

map("n", "<leader>;", function()
  local cursor = vim.api.nvim_win_get_cursor(0)
  --TODO add feature to check end of line to see if ; exists
  vim.cmd("norm A;")
  vim.api.nvim_win_set_cursor(0, cursor)
end, { desc = "add ; to end of line and return to initial cursor position" })

map("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace word under cursor" })

map("n", "<leader>ss", ":w<CR>:so<CR>", { noremap = true, desc = "save and source file" })

map("n", "<leader>nv", ":rightbelow vnew,<CR>", { desc = "open window right side" })

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "chmod +x" })

map("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true, desc = "chmod -x" })

map("n", "<leader>o", "o<Esc>o", { desc = "add new line below" })

map("n", "<leader>O", "O<Esc>O", { desc = "add new line above" })

vim.keymap.set("n", "<leader>Es", function()
  -- Save the current cursor position
  local current_pos = vim.api.nvim_win_get_cursor(0)
  -- Run the substitution command to remove trailing spaces
  vim.cmd([[:%s/\s\+$//e]])
  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, current_pos)
end, { desc = "remove trailing spaces and return to initial cursor location" })

map("n", "<leader>4", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })

map("n", "<leader>5", "<cmd> DapContinue <CR>", { desc = "Start or Continue the debugger" })

map("n", "<Leader>cl", ":set cursorline!<CR>", { desc = "Toggle cursorline highlighting" })

map("n", "q", "<Nop>", { noremap = true, silent = true, desc = "unbind default macro key of q" })

map("n", "\\gq", "vapgq", { desc = "set block of text to 80 width" })

-- quickfix list navigation
-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")
--

-- -- haskell maps
-- local ht = require("haskell-tools")
-- local bufnr = vim.api.nvim_get_current_buf()
-- local opts = { noremap = true, silent = true, buffer = bufnr }
-- -- haskell-language-server relies heavily on codeLenses,
-- -- so auto-refresh (see advanced configuration) is enabled by default
-- vim.keymap.set("n", "<space>cl", vim.lsp.codelens.run, opts)
-- -- Hoogle search for the type signature of the definition under the cursor
-- vim.keymap.set("n", "<space>hs", ht.hoogle.hoogle_signature, opts)
-- -- Evaluate all code snippets
-- vim.keymap.set("n", "<space>ea", ht.lsp.buf_eval_all, opts)
-- -- Toggle a GHCi repl for the current package
-- vim.keymap.set("n", "<leader>rr", ht.repl.toggle, opts)
-- -- Toggle a GHCi repl for the current buffer
-- vim.keymap.set("n", "<leader>rf", function()
-- 	ht.repl.toggle(vim.api.nvim_buf_get_name(0))
-- end, opts)
-- vim.keymap.set("n", "<leader>rq", ht.repl.quit, opts)

-- neorg norg file keys
vim.keymap.set("i", "<c-d>", "<Plug>(neorg.tempus.insert-date.insert-mode)",
  {desc = "insert a link to a date"})

vim.keymap.set("n", "<LocalLeader>n", "<Plug>(neorg.dirman.new-note)", {desc = "create new neorg note"})
