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
      markdown = {
        "vale",
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

    -- lint.linters = {
    --   selene = {
    --     condition = function(_)
    --       local root = LazyVim.root.get({ normalize = true })
    --       if root ~= vim.uv.cwd() then
    --         return false
    --       end
    --       return vim.fs.find({ "selene.toml" }, { path = root, upward = true })[1]
    --     end,
    --   },
    --   luacheck = {
    --     condition = function(_)
    --       local root = LazyVim.root.get({ normalize = true })
    --       if root ~= vim.uv.cwd() then
    --         return false
    --       end
    --       return vim.fs.find({ ".luacheckrc" }, { path = root, upward = true })[1]
    --     end,
    --   },
    -- }

    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
      callback = function()
        local client = vim.lsp.get_clients({ bufnr = 0 })[1] or {}
        lint.try_lint(nil, { cwd = client.root_dir })
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

    {
      "<leader>rLl",
      function()
        local linters = require("lint").get_running()
        if #linters == 0 then
          vim.notify("󰦕")
        else
          vim.notify("󱉶 " .. table.concat(linters, ", "))
        end
      end,
      desc = "List of linters",
    },
    {
      "<leader>rLd",
      function()
        local utils = require("lt.utils.functions")
        local ns = require("lint").get_namespace("selene")
        utils.tprint(vim.diagnostic.get_namespace(ns))
      end,
      desc = "Debug linter configuration",
    },
  },
}
