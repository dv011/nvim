return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
	-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		only_render_image_at_cursor = true,
		code = {
			-- Turn on / off any sign column related rendering
			sign = false,
			-- Width of the code block background:
			--  block: width of the code block
			--  full:  full width of the window
			width = "block",
			min_width = 45,
			left_pad = 1,
			right_pad = 1,
			language_pad = 1,
			-- Determines how code blocks & inline code are rendered:
			--  none:     disables all rendering
			--  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
			--  language: adds language icon to sign column if enabled and icon + name above code blocks
			--  full:     normal + language
			style = "full",
		},
		heading = {
			sign = false,
			width = "block",
		},
		html = {
			enabled = false,
			comment = {
				conceal = false,
			},
		},
	},
}
