local autocmd = vim.api.nvim_create_autocmd

-- stylua: ignore
autocmd({ "BufEnter" }, {
  pattern = "*.txt",
  command = "wincmd L",
})
