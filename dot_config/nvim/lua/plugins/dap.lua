return {
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      local path_lldb = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          -- CHANGE THIS to your path!
          command = path_lldb,
          args = { "--port", "${port}" },

          -- On windows you may have to uncomment this:
          -- detached = false,
        },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- If you want to use this for Rust and C, add something like this:
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
    keys = {
      {
        "<F5>",
        "<cmd>DapContinue<CR>",
        desc = "Debugger: Start",
      },
      {
        "<F4>",
        "<cmd>DapTerminate<CR>",
        desc = "Debugger: Stop",
      },
      {
        "<F9>",
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        desc = "Debugger: Toggle Breakpoint",
      },
      {
        "<F10>",
        "<cmd>DapStepOver<CR>",
        desc = "Debugger: Step Over",
      },
      {
        "<F11>",
        "<cmd>DapStepIn<CR>",
        desc = "Debugger: Step In",
      },
      {
        "<F12>",
        "<cmd>DapStepOut<CR>",
        desc = "Debugger: Step Out",
      },
    },
  },
}
