return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",

    "leoluz/nvim-dap-go",
  },
  keys = {
    {
      "F5",
      function()
        local dap = require("dap")
        dap.continue()
      end,
      desc = "Debugger start/continue (F5)",
    },
    {
      "<leader>dd",
      function()
        local dap = require("dap")
        dap.continue()
      end,
      desc = "Debugger start/continue",
    },
    {
      "<leader>do",
      function()
        local dap = require("dap")
        dap.step_over()
      end,
      desc = "Step over",
    },
    {
      "F8",
      function()
        local dap = require("dap")
        dap.step_over()
      end,
      desc = "Step over (F8)",
    },
    {
      "<leader>di",
      function()
        local dap = require("dap")
        dap.step_into()
      end,
      desc = "Step into",
    },
    {
      "F7",
      function()
        local dap = require("dap")
        dap.step_into()
      end,
      desc = "Step into (F7)",
    },
    {
      "<leader>dO",
      function()
        local dap = require("dap")
        dap.step_out()
      end,
      desc = "Step out",
    },
    {
      "<leader>db",
      function()
        local dap = require("dap")
        dap.toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dh",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Hover widgets",
      mode = { "n", "v" },
    },
    {
      "<leader>/dcc",
      function()
        require("fzf-lua").dap_commands()
      end,
      desc = "DAP commands",
    },
    {
      "<leader>/dco",
      function()
        require("fzf-lua").dap_configurations()
      end,
      desc = "DAP configurations",
    },
    {
      "<leader>/db",
      function()
        require("fzf-lua").dap_breakpoints()
      end,
      desc = "DAP list breakpoints",
    },
    {
      "<leader>/dv",
      function()
        require("fzf-lua").dap_variables()
      end,
      desc = "DAP variables",
    },
    {
      "<leader>/df",
      function()
        require("fzf-lua").dap_frames()
      end,
      desc = "DAP frames",
    },
    {
      "<leader>du",
      function()
        local dap_ui = require("dapui")
        dap_ui.toggle()
      end,
      desc = "Toggle DAP UI",
    },
    {
      "<leader>dl",
      function()
        print(vim.fn.stdpath("cache") .. "/dap.log")
      end,
      desc = "Show log path",
    },
  },
  config = function()
    -- dap.set_log_level("TRACE")
    local icons = require("lt.utils.icons")

    vim.fn.sign_define("DapBreakpoint", { text = icons.dap.breakpoint, texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapStopped", { text = icons.dap.stopped, texthl = "DiagnosticWarn" })
    vim.fn.sign_define("DapBreakpointCondition", { text = icons.dap.breakpoint_condition, texthl = "DiagnosticInfo" })
    vim.fn.sign_define("DapBreakpointRejected", { text = icons.dap.breakpoint_rejected, texthl = "DiagnosticInfo" })

    -- r.noremap("n", "<leader>dbc", function()
    --   local dap = require("dap")
    --   dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    -- end, "Set breakpoint")
    -- r.noremap(
    -- "n",
    -- 	"<leader>dbm",
    -- 	function() require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
    -- 	"dap_set_breakpoint",
    -- 	"Set breakpoint"
    -- )
    --

    -- local dap_ui_variables = require "dap.ui.variables"
    --
    -- r.noremap("n", "<leader>dvc", dap_ui_variables.scopes, "dap", "dap_scopes", "Variables scopes")
    -- r.noremap(
    --   "n",
    -- 	"<leader>dvh",
    -- 	dap_ui_variables.hover,
    -- 	"dap_variables_hover",
    -- 	"Variables hover"
    -- )
    -- r.noremap(
    --   "v",
    -- 	"<leader>dvv",
    -- 	dap.visual_hover,
    -- 	"dap_visual_hover",
    -- 	"Visual hover"
    -- )

    -- local dap_ui_widgets = require "dap.ui.widgets"
    -- r.noremap("n", "<leader>dwh", dap_ui_widgets.hover, "dap", "dap_widgets_hover", "Widgets hover")
    -- r.noremap(
    --   "n",
    -- 	"<leader>dwf",
    -- 	function() require'dap.ui.widgets';widgets.centered_float(widgets.scopes) end,
    -- 	"dap_widgets_scopes",
    -- 	"Widgets scopes"
    -- )

    -- r.noremap("n", "<leader>dro", dap.repl.open, "repl_open", "Open REPL")
    -- r.noremap("n", "<leader>drl", dap.repl.run_last, "repl_run_last", "REPL last")

    local dap_ui = require("dapui")
    dap_ui.setup({})

    local dap_virtual_text = require("nvim-dap-virtual-text")
    dap_virtual_text.setup({})

    require("dap-go").setup()

    local adapters = require("lt.plugins.dap.adapters")
    adapters.setupNode()
  end,
}
