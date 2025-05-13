return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/schemastore.nvim",
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",

    require("lt.plugins.aerial"),
  },
  event = { "BufReadPre", "BufNewFile", "BufEnter" },
  config = function()
    local lspconfig = require("lspconfig")

    local icons = require("lt.utils.icons")

    local presentUfo = pcall(require, "ufo")
    local presentBlinkCmp, blinkCmp = pcall(require, "blink.cmp")
    local ufo = require("lt.plugins.ufo.setup")

    vim.lsp.set_log_level("error") -- 'trace', 'debug', 'info', 'warn', 'error'

    local function try_attach_inlay_hints(client, bufnr)
      if client.server_capabilities.inlayHintProvider then
        vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

        vim.api.nvim_create_autocmd("InsertEnter", {
          buffer = bufnr,
          callback = function()
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end,
          group = "lsp_augroup",
        })
        vim.api.nvim_create_autocmd("InsertLeave", {
          buffer = bufnr,
          callback = function()
            vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
          end,
          group = "lsp_augroup",
        })
      end
    end

    local function on_attach(client, bufnr)
      -- print(client.name)
      -- require("lt.utils.functions").tprint_keys(client.server_capabilities)

      try_attach_inlay_hints(client, bufnr)

      if client.name == "tsserver" then
        -- let prettier format
        client.server_capabilities.document_formatting = false
        client.server_capabilities.documentFormattingProvider = false
      end
    end

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
      bashls = {},
      yamlls = require("lt.plugins.lsp.servers.yamlls")(capabilities),
      jsonls = require("lt.plugins.lsp.servers.jsonls")(capabilities),
      html = {},
      cssls = {},
      lua_ls = require("lt.plugins.lsp.servers.lua_ls")(on_attach),
      dockerls = {},
      -- csharp_ls = {},
      -- omnisharp = {},
      -- volar=vue
      volar = {},
      graphql = {},
      eslint = require("lt.plugins.lsp.servers.eslint")(on_attach),
      biome = {},
      -- svelte = {},
      -- angularls = {},
      -- tailwindcss = {},
      texlab = {},
      ansiblels = {},
      gopls = {},
      terraformls = {},
      -- clangd = {},
      -- azure_pipelines_ls = {},
      powershell_es = {},
      vtsls = require("lt.plugins.lsp.servers.vtsls")(on_attach),
      ocamllsp = {},
      pyright = {},
      -- ruff = {},
      -- pylsp = {},
    }

    local default_lsp_config = {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 200,
        allow_incremental_sync = true,
      },
    }

    local server_names = {}
    for server_name, _ in pairs(servers) do
      table.insert(server_names, server_name)
    end

    local present_mason, mason = pcall(require, "mason-lspconfig")
    if present_mason then
      mason.setup({ ensure_installed = server_names, automatic_installation = true, automatic_enable = true })
    else
      vim.notify("mason not there, cannot install lsp servers")
    end

    for server_name, server_config in pairs(servers) do
      local merged_config = vim.tbl_deep_extend("force", default_lsp_config, server_config)

      lspconfig[server_name].setup(merged_config)
    end

    ufo.setupWithFallback()
  end,
}
