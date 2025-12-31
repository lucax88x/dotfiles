return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lint
        "shellcheck",
        "selene",
        "stylelint",
        "yamllint",
        "jsonlint",

        -- go
        -- managed by mise
        -- "golangci-lint",
        -- "goimports",

        -- format
        "stylua",
        "jq",
        "shfmt",
        "prettierd",
        "shfmt",
        "xmlformatter",
        "ocamlformat",
        "tfsec",
        -- "lazyfmt",
        "powershell-editor-services",

        -- format toml
        "taplo",

        -- bash
        -- python
        -- "ruff",
        -- "isort"
      },
    })
  end,
  dependencies = { "mason-org/mason.nvim" },
  cmd = { "MasonToolsInstall" },
}
