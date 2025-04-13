return {
	{
		"ThePrimeagen/harpoon",
		keys = {
			{ "<leader>A", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoonAddFile" },
			{ "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoonToggleQuickMenu" },
			{ "<M-a>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoonToggleQuickMenu"},
			{ "<M-s>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoonToggleQuickMenu"},
			{ "<M-d>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoonToggleQuickMenu"},
			{ "<M-f>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoonToggleQuickMenu"},
		},
	},
}
