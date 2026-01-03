return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = {
        "selene"
      },
      -- markdown = {
      --   "vale",
      -- },
      sh = {
        "shellcheck",
      },
      bash = {
        "shellcheck",
      },
      zsh = {
        "zsh",
      },
      css = {
        "stylelint",
      },
      scss = {
        "stylelint",
      },
      sass = {
        "stylelint",
      },
      yaml = {
        "yamllint",
      },
      yml = {
        "yamllint",
      },
      json = {
        "jsonlint",
      },
      go = {
        "golangcilint",
      },
      Terraform = {
        "tfsec",
      },
      python = {
        "ruff",
      },
      typescript = {
        "biomejs",
      },
      javascript = { "biomejs" },
      javascriptreact = {
        "biomejs",
      },
      typescriptreact = {
        "biomejs",
      },
      -- vue = { "eslint_d" },
    }
  end,
  keys = {
    {
      "<leader>rl",
      function()
        local lint = require("lint")
        lint.try_lint()
      end,
      desc = "lint: run",
    },

    {
      "<leader>rLl",
      function()
        local linters = require("lint").get_running()
        if #linters == 0 then
          vim.notify("󰦕  No linters")
        else
          vim.notify("󱉶 " .. table.concat(linters, ", "))
        end
      end,
      desc = "lint: list of linters",
    },
    {
      "<leader>rLi",
      function()
        local utils = require("lt.utils.functions")
        local filetype = vim.bo.filetype
        local linters = require("lint").linters_by_ft[filetype]
        utils.tprint(linters)
      end,
      desc = "lint: get linters by filetype",
    },
    {
      "<leader>rLd",
      function()
        local utils = require("lt.utils.functions")
        local ns = require("lint").get_namespace("golangcilint")
        utils.tprint(vim.diagnostic.get_namespace(ns))
      end,
      desc = "lint: debug configuration",
    },
  },
}
