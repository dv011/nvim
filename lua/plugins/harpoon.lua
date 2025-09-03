return {
  {
    "ThePrimeagen/harpoon",
    keys = {
      { "<leader>A", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoonAddFile" },
      { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoonToggleQuickMenu" },
      { "<A-c>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoonToggleQuickMenu1"},
      { "<A-v>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoonToggleQuickMenu2"},
      { "<A-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoonToggleQuickMenu3"},
      { "<A-m>", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "harpoonToggleQuickMenu4"},
    },
  },
}
