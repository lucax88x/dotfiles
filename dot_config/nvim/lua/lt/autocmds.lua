vim.api.nvim_create_augroup("init", { clear = true })

local function generate_buf_keymap(bufnr)
  return function(type, input, output, extraOptions)
    local options = { buffer = bufnr }

    if extraOptions ~= nil then
      options = vim.tbl_deep_extend("force", options, extraOptions)
    end

    vim.keymap.set(type, input, output, options)
  end
end

local function lsp_action(action)
  vim.lsp.buf.code_action({
    apply = true,
    context = {
      only = { action },
      diagnostics = {},
    },
  })
end

local function lsp_execute(opts)
  local params = {
    command = opts.command,
    arguments = opts.arguments,
  }
  if opts.open then
    require("trouble").open({
      mode = "lsp_command",
      params = params,
    })
  else
    return vim.lsp.buf_request(0, "workspace/executeCommand", params, opts.handler)
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local buf_keymap = generate_buf_keymap(event.buf)
    local filetype = vim.api.nvim_get_option_value("filetype", { buf = event.buf or 0 })
    local is_typescript = filetype == "typescript" or filetype == "typescriptreact" or filetype == "vue"

    -- definition
    buf_keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    --   buf_keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    buf_keymap("n", "gr", function()
      require("fzf-lua").lsp_references()
    end, { desc = "Show references" })
    -- buf_keymap("n", "gr", "<cmd>Trouble lsp_references toggle focus=false<cr>", "Show references")

    buf_keymap("n", "<leader>tO", function()
      require("fzf-lua").lsp_document_symbols()
    end, { desc = "Document symbols" })

    buf_keymap("n", "<leader>ts", vim.lsp.buf.signature_help, { desc = "Show signature" })
    -- end definition

    -- implementation
    buf_keymap("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    -- buf_set_keymap("n", "gI", function()
    --   require("fzf-lua").lsp_implementations()
    -- end, "Search implementations")
    buf_keymap(
      "n",
      "gI",
      "<cmd>Trouble lsp_implementations toggle focus=false<cr>",
      { desc = "Search implementations" }
    )
    -- end implementation

    -- diagnostics
    -- buf_set_keymap("n", "<leader>te", function()
    --   require("fzf-lua").diagnostics_document()
    -- end, "Show diagnostics")
    -- buf_set_keymap("n", "<leader>tE", "<cmd>Trouble diagnostics toggle<cr>", "Show workspace diagnostics")
    buf_keymap(
      "n",
      "<leader>te",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { desc = "Show buffer diagnostics" }
    )
    buf_keymap("n", "<leader>tE", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
    -- end diagnostics

    if pcall(require, "aerial") then
      -- buf_set_keymap("n", "<leader>to", "<cmd>AerialToggle!<CR>", "(Aerial) Document symbols")
      buf_keymap(
        "n",
        "<leader>to",
        "<cmd>Trouble lsp_document_symbols toggle focus=false<cr>",
        { desc = "Document symbols (aerial)" }
      )
    end

    -- rename
    buf_keymap("n", "<leader>rR", vim.lsp.buf.rename, { desc = "Rename" })
    buf_keymap("n", "<leader>rr", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { desc = "Incremental Rename", expr = true })
    -- end rename

    -- actions
    buf_keymap({ "n", "v" }, "<leader>ra", vim.lsp.buf.code_action, { desc = "Code actions" })
    buf_keymap({ "n", "v" }, "<leader>rA", function()
      local line_count = vim.api.nvim_buf_line_count(event.buf)
      --[[ local range = vim.lsp.util.make_given_range_params({ 1, 1 }, { line_count, 1 }, bufnr) ]]
      local range = {
        start = { line = 1, character = 1 },
        ["end"] = { line = line_count, character = 1 },
      }

      vim.lsp.buf.code_action({ range = range.range })
    end, { desc = "Buffer code actions" })
    -- end actions

    -- debug
    buf_keymap("n", "<leader>lsc", function()
      print(vim.inspect(vim.lsp.get_clients()))
    end, { desc = "LSP clients" })

    buf_keymap("n", "<leader>lsl", function()
      print(vim.lsp.get_log_path())
    end, { desc = "Show log path" })

    buf_keymap("n", "<leader>lsa", ":checkhealth vim.lsp<CR>", { desc = "LSP Info" })
    -- end debug

    if is_typescript then
      buf_keymap("n", "gD", function()
        local params = vim.lsp.util.make_position_params()
        lsp_execute({
          command = "typescript.goToSourceDefinition",
          arguments = { params.textDocument.uri, params.position },
          open = true,
        })
      end, { desc = "Go to definition" })

      buf_keymap("n", "<leader>rio", function()
        lsp_action("source.organizeImports")
      end, { desc = "Organize imports (TS)" })

      buf_keymap("n", "<leader>riu", function()
        lsp_action("source.removeUnused.ts")
      end, { desc = "Remove unused variables (TS)" })

      buf_keymap("n", "<leader>rim", function()
        lsp_action("source.addMissingImports.ts")
      end, { desc = "Import missing imports (TS)" })

      buf_keymap("n", "<leader>rV", function()
        lsp_execute({ command = "typescript.selectTypeScriptVersion" })
      end, { desc = "Select TS workspace version" })
    end
  end,
  group = "init",
})
