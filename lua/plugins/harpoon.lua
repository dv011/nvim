return {
    {
        "ThePrimeagen/harpoon",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
            { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "harpoonAddFile"},
            { "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "harpoonToggleQuickMenu"},
            { "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoonToggleQuickMenu"},
            { "<C-j>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoonToggleQuickMenu"},
            { "<C-k>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoonToggleQuickMenu"},
            { "<C-l>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoonToggleQuickMenu"},
        },
    },
}
