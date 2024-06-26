return {
  "mfussenegger/nvim-lint",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      lua = {
        "selene",
      },
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
      -- typescript = {
      --   "eslint_d",
      -- },
      -- javascript = { "eslint_d" },
      -- javascriptreact = {
      --   "eslint_d",
      -- },
      -- typescriptreact = {
      --   "eslint_d",
      -- },
      -- vue = { "eslint_d" },
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
  keys = {
    {
      "<leader>rl",
      function()
        local lint = require("lint")
        lint.try_lint()
      end,
      desc = "Lint",
    },
  },
}
