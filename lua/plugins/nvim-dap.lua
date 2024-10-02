return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("mason").setup()
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()

    dap.adapters["local-lua"] = {
      type = "executable",
      command = "node",
      args = {
        "/absolute/path/to/local-lua-debugger-vscode/extension/debugAdapter.js"
      },
      enrich_config = function(config, on_config)
        if not config["extensionPath"] then
          local c = vim.deepcopy(config)
          -- 💀 If this is missing or wrong you'll see 
          -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
          c.extensionPath = "/absolute/path/to/local-lua-debugger-vscode/"
          on_config(c)
        else
          on_config(config)
        end
      end,
    }

    dap.configurations.lua ={
      {
        name = 'Current file (local-lua-dbg, lua)',
        type = 'local-lua',
        request = 'launch',
        cwd = '${workspaceFolder}',
        program = {
          lua = 'lua5.1',
          file = '${file}',
        },
        args = {},
      },
    }

    dap.adapters.gdb = {
        type = "executable",
        command = "/usr/local/bin/gdb",
        args = { "-i", "dap" }
    }   

    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input(vim.fn.getcwd() .. '/', 'main')
        end,
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }

      vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<F1>", dap.continue)
      vim.keymap.set("n", "<F2>", dap.step_into)
      vim.keymap.set("n", "<F3>", dap.step_over)
      vim.keymap.set("n", "<F4>", dap.step_out)
      vim.keymap.set("n", "<F5>", dap.step_back)
      vim.keymap.set("n", "<F13>", dap.restart)

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}

-- return {
--   -- Debug Adapter Protocol for Neovim
--   {
--     'mfussenegger/nvim-dap',
--     config = function()
--       local dap = require('dap')
      
--       dap.adapters.lua = {
--         type = 'executable',
--         command = 'lua', -- adjust as needed, e.g., 'lua5.1', 'lua5.3', etc.
--         args = {}
--       }

--       dap.configurations.lua = {
--         {
--           type = 'lua',
--           request = 'launch',
--           name = 'Launch file',
--           program = '${file}', -- This configuration will launch the current file.
--         }
--       }

--       vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

--       vim.api.nvim_set_keymap('n', '<F5>', '<cmd>lua require\'dap\'.continue()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua require\'dap\'.step_over()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<F11>', '<cmd>lua require\'dap\'.step_into()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<F12>', '<cmd>lua require\'dap\'.step_out()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require\'dap\'.toggle_breakpoint()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<leader>B', '<cmd>lua require\'dap\'.set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require\'dap\'.repl.open()<CR>', {noremap = true, silent = true})
--       vim.api.nvim_set_keymap('n', '<leader>dl', '<cmd>lua require\'dap\'.run_last()<CR>', {noremap = true, silent = true})
--     end
--   },

--   -- DAP UI for a better experience
--   {
--     'rcarriga/nvim-dap-ui',
--     'nvim-neotest/nvim-nio',
--     requires = {'mfussenegger/nvim-dap'},
--     config = function()
--       local dap, dapui = require('dap'), require('dapui')
--       dapui.setup()
      
--       dap.listeners.after.event_initialized['dapui_config'] = function()
--         dapui.open()
--       end
--       dap.listeners.before.event_terminated['dapui_config'] = function()
--         dapui.close()
--       end
--       dap.listeners.before.event_exited['dapui_config'] = function()
--         dapui.close()
--       end
--     end
--   },

--   -- Virtual text for dap
--   {
--     'theHamsta/nvim-dap-virtual-text',
--     requires = {'mfussenegger/nvim-dap'},
--     config = function()
--       require("nvim-dap-virtual-text").setup()
--     end
--   }
-- }
