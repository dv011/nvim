return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
	["core.defaults"] = {},
	["core.summary"] = {},
	["core.concealer"] = {
	  config = {
	    icons = {
	      code_block = {
		conceal = true,
		width = "content",
		highlight = "@neorg.tags.ranged_verbatim.code_block",
	      },
	      heading = {
		icons = {
		  "󰉫",
		  "󰉬",
		  "󰉭",
		  "󰉮",
		  "󰉯",
		  "󰉰",
		},
	      },
	    },
	  },
	},
	["core.dirman"] = {
	  config = {
	    workspaces = {
	      neorg = "~/casa/work/zet/neorg/",
	      nixvim = "~/.config/nixvim",
	    },
	    index = "index.norg",
	    default_workspace = "neorg",
	  },
	},
      },
    })
  end,
  keys = {
    { "<leader>ni", "<CMD>Neorg index<CR>",  desc = "neorg index" },
    { "<leader>nr", "<CMD>Neorg return<CR>", desc = "neorg return" },
    { "<leader>nt", "<CMD>Neorg toc<CR>",    desc = "neorg table of contents" },
  },
}
