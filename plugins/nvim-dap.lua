return {
  src = "mfussenegger/nvim-dap",
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    "rcarriga/nvim-dap-ui",

    -- Required dependency for nvim-dap-ui
    "nvim-neotest/nvim-nio",

    -- Installs the debug adapters for you
    "mason-org/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<leader>c",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<leader>si",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<leader>sO",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<leader>Dso",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
    {
      "<leader>b",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>B",
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      desc = "Debug: Set Conditional Breakpoint",
    },
    {
      "<leader>t",
      function()
        require("dap").toggle()
      end,
      desc = "Debug: Toggle UI",
    },
    {
      "<leader>l",
      function()
        require("dap").run_last()
      end,
      desc = "Debug: Run Last Configuration",
    },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    require("mason-nvim-dap").setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        "delve",
      },
    }

    dapui.setup {
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    }

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Setup virtual text to show variable values inline
    require("nvim-dap-virtual-text").setup()
  end,
}
