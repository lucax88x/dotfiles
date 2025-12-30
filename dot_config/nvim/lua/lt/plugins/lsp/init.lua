return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    "saghen/blink.cmp",
  },
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  config = function()
    local icons = require("lt.utils.icons")

    local presentUfo = pcall(require, "ufo")
    local presentBlinkCmp, blinkCmp = pcall(require, "blink.cmp")
    local ufo = require("lt.plugins.ufo.setup")

    vim.lsp.log.set_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

    local config = {
      -- show signs
      update_in_insert = false,
      underline = true,
      float = {
        focus = false,
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      -- virtual_lines = true,
      virtual_lines = false,
      -- virtual_lines = { current_line = true },
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
          [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
        },
      },
      inlay_hints = {
        enabled = true,
        exclude = {}, -- filetypes for which you don't want to enable inlay hints
      },
      codelens = {
        enabled = false,
      },
      document_highlight = {
        enabled = true,
      },
    }

    vim.diagnostic.config(config)

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    if presentBlinkCmp then
      config.capabilities = blinkCmp.get_lsp_capabilities(capabilities)
    end

    if presentUfo then
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    end

    capabilities.textDocument.completion.completionItem.snippetSupport = true

    local servers = {
      "bashls",
      "yamlls",
      "jsonls",
      "html",
      "cssls",
      "lua_ls",
      "dockerls",
      -- csharp_ls,
      -- omnisharp,
      -- volar,
      -- vue_ls,
      "graphql",
      "eslint",
      "biome",
      -- svelte = {},
      -- angularls = {},
      -- tailwindcss = {},
      "texlab",
      "ansiblels",
      "gopls",
      "terraformls",
      -- clangd = {},
      -- azure_pipelines_ls = {},
      "powershell_es",
      "vtsls",
      -- "tsgo",
      -- ocamllsp = {},
      "pyright",
      -- ruff = {},
      -- pylsp = {},
      "copilot",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_installation = true,
    })

    for _, server_name in pairs(servers) do
      local success_enable, err_enable = pcall(vim.lsp.enable, server_name)
      if not success_enable then
        print("failed to enable " .. server_name .. ": " .. tostring(err_enable))
        goto continue
      end

      ::continue::
    end

    ufo.setupWithFallback()
  end,
}
