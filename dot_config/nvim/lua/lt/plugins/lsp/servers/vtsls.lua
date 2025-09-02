return function(on_attach)
  return {
    -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    settings = {
      complete_function_calls = true,
      vtsls = {
        tsserver = { globalPlugins = {} },
        enableMoveToFileCodeAction = true,
        autoUseWorkspaceTsdk = true,
        experimental = {

          maxInlayHintLength = 30,
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
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
      },
    },
    -- before_init = function(params, config)
    --   local result = vim
    --     .system({ "npm", "query", "#vue" }, { cwd = params.workspaceFolders[1].name, text = true })
    --     :wait()
    --   if result.stdout ~= "[]" then
    --     table.insert(config.settings.vtsls.tsserver.globalPlugins, {
    --       name = "@vue/typescript-plugin",
    --       location = require("mason-registry").get_package("vue-language-server"):get_install_path()
    --         .. "/node_modules/@vue/language-server",
    --       languages = { "vue" },
    --       configNamespace = "typescript",
    --       enableForWorkspaceTypeScriptVersions = true,
    --     })
    --   end
    -- end,
    on_attach = on_attach,
  }
end
