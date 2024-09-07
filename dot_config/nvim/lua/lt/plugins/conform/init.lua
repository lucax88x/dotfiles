return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = nil,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier", stop_after_first = true } },
        typescript = { { "prettierd", "prettier", stop_after_first = true } },
        javascriptreact = { { "prettierd", "prettier", stop_after_first = true } },
        typescriptreact = { { "prettierd", "prettier", stop_after_first = true } },
        vue = { { "prettierd", "prettier", stop_after_first = true } },
        css = { { "prettierd", "prettier", stop_after_first = true } },
        go = { "gofmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
        xml = { "xmlformat" },
        json = { "jq" },
      },
    })
  end,
  keys = {
    {
      "<leader>rf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format",
    },
  },
}

-- formatting.prettierd,
-- formatting.stylelint,
-- -- formatting.nginx_beautifier,
-- formatting.shfmt,
-- formatting.xmllint,
-- formatting.terraform_fmt,
-- formatting.yamlfmt,
-- formatting.jq,
-- formatting.clang_format,
