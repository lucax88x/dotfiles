return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lint
        "selene",
        "stylelint",
        "yamllint",
        "jsonlint",

        -- go
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

        -- python
        -- "ruff",
        -- "isort"
      },
    })
  end,
  dependencies = { "mason-org/mason.nvim" },
  cmd = { "MasonToolsInstall" },
}
