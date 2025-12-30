return {
  "stevearc/conform.nvim",
  opts = {},
  config = function()
    require("conform").setup({
      format_on_save = nil,
      formatters = {
        biome = {
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        vue = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        css = { "biome-check", "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        md = { "prettierd", "prettier", stop_after_first = true },
        php = { "pretty-php" },
        go = { "gofmt" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        yaml = { "yamlfmt" },
        xml = { "xmlformat" },
        json = { "biome-check", "jq", stop_after_first = true },
        groovy = { "npm-groovy-lint" },
        toml = { "taplo" },
        ocaml = { "ocamlformat" },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
      },
    })
  end,
  keys = {
    {
      "<leader>rf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "conform: format",
    },
  },
}
