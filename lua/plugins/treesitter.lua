-- config is based on https://www.reddit.com/r/neovim/comments/1039iti/minimal_config_with_lazy_treesitter_lspzero/;
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from cmdline
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"cpp",
					"gdscript",
					"godot_resource",
					"gdshader",
					"bash",
					"c",
					"cpp",
					"html",
					"json",
					"lua",
					"markdown",
					"markdown_inline",
					"nix",
					"python",
					"ruby",
					"vimdoc",
				},
				highlight = { enable = true },
				indent = { enable = true },
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			})
		end,
	},
}
--init = function(plugin)
---- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
---- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
---- no longer trigger the **nvim-treesitter** module to be loaded in time.
---- Luckily, the only things that those plugins need are the custom queries, which we make available
---- during startup.
--    require("lazy.core.loader").add_to_rtp(plugin)
--    require("nvim-treesitter.query_predicates")
--end,
--cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
--opts_extend = { "ensure_installed" },
-----@type TSConfig
-----@diagnostic disable-next-line: missing-fields
--opts = {
--    -- Automatically install missing parsers when entering buffer
--    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
--    auto_install = false,
--    -- Install parsers synchronously (only applied to `ensure_installed`)
--    sync_install = false,
--    highlight = { enable = true },
--textobjects = {
--  move = {
--    enable = true,
--    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
--    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
--    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
--    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
--  },

--},

--},
-----@param opts TSConfig
--config = function(_, opts)
--if type(opts.ensure_installed) == "table" then
--  opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
--end
--require("nvim-treesitter.configs").setup(opts)
--end,
