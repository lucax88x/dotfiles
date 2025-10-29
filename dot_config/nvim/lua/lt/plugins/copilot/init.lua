return {
  "zbirenbaum/copilot.lua",
  -- nes handled by sidekick
  init = function()
    vim.lsp.config('copilot', {
      settings = {
        telemetry = {
          telemetryLevel = "off",
        },
      },
    })

    vim.g.copilot_nes_debounce = 500
    vim.lsp.enable("copilot_ls")

    local map = vim.keymap.set
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local buffer = ev.buf

        if client then
          if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
            vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })
            map('i', '<C-Space>',
              function()
                vim.lsp.completion.get()
              end,
              { desc = "Trigger lsp completion" }
            )
          end

          if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion) then
            vim.lsp.inline_completion.enable(true)
            map("i", "<Tab>",
              function()
                if not vim.lsp.inline_completion.get() then
                  return "<Tab>"
                end
              end,
              { expr = true, replace_keycodes = true, desc = "Apply the currently displayed completion suggestion" }
            )
            map("i", "<M-n>",
              function()
                vim.lsp.inline_completion.select({})
              end,
              { desc = "Show next inline completion suggestion", }
            )
            map("i", "<M-p>",
              function()
                vim.lsp.inline_completion.select({ count = -1 })
              end,
              { desc = "Show previous inline completion suggestion", }
            )
          end

          -- Add normal-mode keymappings for signature help
          if client:supports_method('textDocument/signatureHelp') then
            map('n', '<C-s>',
              function()
                vim.lsp.buf.signature_help()
              end,
              { desc = "Trigger lsp signature help" }
            )
          end
        end
      end
    })
  end,
}
