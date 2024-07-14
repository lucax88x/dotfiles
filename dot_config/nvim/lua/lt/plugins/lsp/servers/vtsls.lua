return function(on_attach)
  return {
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    settings = {
      complete_function_calls = true,
      vtsls = {
        tsserver = { globalPlugins = {} },
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        preferences = {
          importModuleSpecifier = "non-relative",
        },
        -- inlayHints = {
        --   enumMemberValues = { enabled = true },
        --   functionLikeReturnTypes = { enabled = true },
        --   parameterNames = { enabled = "literals" },
        --   parameterTypes = { enabled = true },
        --   propertyDeclarationTypes = { enabled = true },
        --   variableTypes = { enabled = false },
        -- },
      },
    },
    before_init = function(params, config)
      local result = vim
        .system({ "npm", "query", "#vue" }, { cwd = params.workspaceFolders[1].name, text = true })
        :wait()
      if result.stdout ~= "[]" then
        table.insert(config.settings.vtsls.tsserver.globalPlugins, {
          name = "@vue/typescript-plugin",
          location = require("mason-registry").get_package("vue-language-server"):get_install_path()
            .. "/node_modules/@vue/language-server",
          languages = { "vue" },
          configNamespace = "typescript",
          enableForWorkspaceTypeScriptVersions = true,
        })
      end
    end,
    on_attach = on_attach,
    -- on_attach = function(client, bufnr)
    -- client.server_capabilities.documentFormattingProvider = false
    -- client.server_capabilities.documentRangeFormattingProvider = false
    -- vim.keymap.set("n", "grR", function()
    --   client.request(
    --     -- "volar/client/findFileReference",
    --     "textDocument/reference",
    --     { textDocument = vim.lsp.util.make_text_document_params(bufnr) },
    --     function(_, locations, context)
    --       local items = vim.lsp.util.locations_to_items(locations, client.offset_encoding)
    --       vim.fn.setqflist({}, " ", { title = "Vue File References", items = items, context = context })
    --       require("fzf-lua").quickfix()
    --       -- vim.api.nvim_command "copen"
    --     end,
    --     bufnr
    --   )
    -- end, { desc = "Vue file reference" })
    -- end,
  }
end
