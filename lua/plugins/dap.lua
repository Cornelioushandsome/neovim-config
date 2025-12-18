return {
  { "nvim-neotest/nvim-nio" },
  {"mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    -- Load modules
    local dap = require("dap")
    local dapui = require("dapui")

    -------------------------------------------------------------------------
    -- DAP UI
    -------------------------------------------------------------------------
    dapui.setup()

    -- Automatically open/close the UI when debugging starts/stops
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    -------------------------------------------------------------------------
    -- C/C++ LLDB Adapter (macOS)
    -------------------------------------------------------------------------
    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-dap", -- Comes with Xcode Command Line Tools
      name = "lldb"
    }

    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        runInTerminal = false,
      },
    }

    -- Use same config for C
    dap.configurations.c = dap.configurations.cpp
 

    -------------------------------------------------------------------------
    -- Virtual Text (inline variable info)
    -------------------------------------------------------------------------
    require("nvim-dap-virtual-text").setup()

    -------------------------------------------------------------------------
    -- Keymaps (Minimal, essential)
    -------------------------------------------------------------------------
    vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
    vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
    vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "DAP Step Into" })
    vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "DAP Step Out" })
    vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Conditional Breakpoint" })
    vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "DAP REPL" })
    vim.keymap.set("n", "<leader>du", function() dapui.toggle() end, { desc = "DAP UI Toggle" })
  end,
  }
}

