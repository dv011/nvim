require("muffins.set")
require("muffins.remap")
require("muffins.lazy")
require("muffins.autoCmd")

-- -- -- require("lspconfig").clangd.setup({})
-- -- vim.lsp.enable("clangd")
-- -- require("lspconfig").lua_ls.setup({})
-- vim.lsp.config["luals"] = {
-- 	-- Command and arguments to start the server.
-- 	cmd = { "lua-language-server" },
-- 	-- Filetypes to automatically attach to.
-- 	filetypes = { "lua" },
-- 	-- Sets the "root directory" to the parent directory of the file in the
-- 	-- current buffer that contains either a ".luarc.json" or a
-- 	-- ".luarc.jsonc" file. Files that share a root directory will reuse
-- 	-- the connection to the same LSP server.
-- 	root_markers = { ".luarc.json", ".luarc.jsonc" },
-- 	-- Specific settings to send to the server. The schema for this is
-- 	-- defined by the server. For example the schema for lua-language-server
-- 	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
-- 	-- settings = {
-- 	-- 	Lua = {
-- 	-- 		runtime = {
-- 	-- 			version = "3.13.6",
-- 	-- 		},
-- 	-- 	},
-- 	-- },
-- }

-- vim.lsp.enable("luals")

require("lspconfig").clangd.setup({})
-- require("lspconfig").lua_ls.setup({})
require("lspconfig").gdscript.setup({})
require("lspconfig").markdown_oxide.setup({})
require("lspconfig")["hls"].setup({
	filetypes = { "haskell", "lhaskell", "cabal" },
})
require("nvim-highlight-colors").setup({})
require("ccc").setup({})
