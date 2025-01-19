return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = nil,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
        vue = { "biome", "prettierd", "prettier", stop_after_first = true },
        css = { "biome", "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        go = { "gofmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
        xml = { "xmlformat" },
        json = { "biome", "jq", stop_after_first = true },
        toml = { "taplo" },
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
