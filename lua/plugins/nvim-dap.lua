return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio", 
    "suketa/nvim-dap-ruby",
  },
  config = function()
    require("dap-ruby").setup()
  end
}
