return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<leader>\]],
      direction = "float",
      autochdir = true,
      -- direction = 'horizontal',
      -- on_open = function(term)
      -- 	vim.cmd("TermExec cmd='g++ -std=c++17 -Werror -pedantic-errors -Wall -Weffc++ -Wextra -Wconversion -Wsign-conversion -o hello_world hello_world.cpp'")
      -- 	vim.cmd("TermExec cmd='./hello_world'")
      -- 	vim.cmd("TermExec cmd='rm hello_world'")
      -- end,
    },
  },
}
