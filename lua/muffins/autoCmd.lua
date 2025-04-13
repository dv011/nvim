local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
	end,
})

-- https://www.youtube.com/watch?v=9gUatBHuXE0&ab_channel=TJDeVries
-- TODO: make this function get the path to the current file or use a autorun 
-- file that specifies the values we want
-- on second thought, this should always look for an autorun file in the path of
-- the current buffer and if this file does not exist it should prompt for the
-- values
-- create two of these, one that open a new split below and another that will 
-- open the output in a floating window
local attach_to_buffer = function(output_bufnr, pattern, command)
autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("dev-extensions", { clear = true }),
  pattern = pattern,
  callback = function()
    local append_data = function(_, data)
      if data then
	vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
      end
    end,

    vim.api.nvim_buf_set_lines(output_bufnr, 0, 0, false, {"output:"})
    vim.fn.jobstart(command, {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_data,
    })
  end,
})
end

-- attach_to_buffer(output_bufnr, pattern, command)

vim.api.nvim_create_user_command("Autorun", function()
  print "AutoRun starts now .."
  local output_bufnr = tonumber(vim.fn.input("Output Bufnr: "))
  print("chose:", output_bufnr)
  local pattern = vim.fn.input("Pattern: ")
  print("chose:", pattern)
  local command = vim.split(vim.fn.input("Command: "), " ")
  print("chose:", command)
  attach_to_buffer(output_bufnr, pattern, command)
end, {})
