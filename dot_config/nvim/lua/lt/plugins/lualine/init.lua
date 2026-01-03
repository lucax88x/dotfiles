return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "folke/sidekick.nvim",
  },
  event = "VeryLazy",
  init = function()
    -- disable until lualine loads
    vim.opt.laststatus = 0
  end,
  opts = function()
    local icons = require("lt.utils.icons")

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        refresh = {
          statusline = 500,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diff",
            symbols = {
              added = icons.git.Added,
              modified = icons.git.Modified,
              removed = icons.git.Removed,
            },
          },
        },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          {
            "filetype",
            icon_only = false,
            separator = "",
            padding = {
              left = 1,
              right = 0,
            },
          },
          {
            "filename",
            path = 1,
            fmt = function(path)
              return table.concat(
                { vim.fs.basename(vim.fs.dirname(path)), vim.fs.basename(path) },
                package.config:sub(1, 1)
              )
            end,
            symbols = {
              modified = "  ",
              readonly = "",
              unnamed = "",
            },
          },
          {
            function()
              return " "
            end,
            color = function()
              local status = require("sidekick.status").get()
              if status then
                return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
              end
            end,
            cond = function()
              local status = require("sidekick.status")
              return status.get() ~= nil
            end,
          },
        },
        lualine_x = {
          {
            function()
              local status = require("sidekick.status").cli()
              return " " .. (#status > 1 and #status or "")
            end,
            cond = function()
              return #require("sidekick.status").cli() > 0
            end,
            color = function()
              return "Special"
            end,
          },
          "overseer",
        },
        lualine_y = {
          {
            "fileformat",
            icons_enabled = true,
          },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { "searchcount" },
          { "selectioncount" },
          { "hostname" },
          function()
            return os.date("%R")
          end,
        },
      },
      extensions = { "nvim-dap-ui", "quickfix" },
    }
  end,
}
