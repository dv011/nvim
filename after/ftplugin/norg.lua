local autocmd = vim.api.nvim_create_autocmd

--enable text wrapping for markdown files
autocmd("filetype", {
	pattern = "norg",
	command = "setlocal wrap textwidth=80 formatoptions+=t",
})
