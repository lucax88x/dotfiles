return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        deepseekcoder = function()
          require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "deepseek-coder:6.7b",
              },
            },
          })
        end,
        --     deepseekcoderv2 = function()
        --       return require("codecompanion.adapters").extend("ollama", {
        --         schema = {
        --           model = {
        --             default = "deepseek-coder-v2:latest",
        --           },
        --         },
        --       })
        --     end,
        llama3 = function()
          return require("codecompanion.adapters").extend("ollama", {
            name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
            schema = {
              model = {
                default = "llama3:8b",
              },
              num_ctx = {
                default = 2048,
              },
            },
          })
        end,
      },
      strategies = {
        chat = { adapter = "llama3" },
        inline = { adapter = "deepseekcoder" },
        agent = { adapter = "llama3" },
      },
      -- adapters = {
      --   llama3 = function()
      --     return require("codecompanion.adapters").extend("ollama", {
      --       name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
      --       schema = {
      --         model = {
      --           default = "llama3:latest",
      --         },
      --         num_ctx = {
      --           default = 16384,
      --         },
      --         num_predict = {
      --           default = -1,
      --         },
      --       },
      --     })
      --   end,
      -- },
    })

    -- require("codecompanion").setup({
    --   strategies = {
    --     chat = {
    --       adapter = "llama3",
    --     },
    --     inline = {
    --       adapter = "deepseekcoder",
    --     },
    --     agent = {
    --       adapter = "llama3",
    --     },
    --   },
    --   -- strategies = {
    --   --   chat = "llama3",
    --   --   inline = "deepseekcoderv2",
    --   --   agent = "llama3",
    --   -- },
    --
    --   adapters = {
    --     llama3 = function()
    --       return require("codecompanion.adapters").extend("ollama", {
    --         schema = {
    --           model = {
    --             default = "llama3:8b",
    --           },
    --           num_ctx = {
    --             default = 16384,
    --           },
    --           num_predict = {
    --             default = -1,
    --           },
    --         },
    --       })
    --     end,
    --   },
    -- })
    -- Expand `cc` into CodeCompanion in the command line

    vim.cmd([[cab cc CodeCompanion]])

    -- vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("n", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "<LocalLeader>a", "<cmd>CodeCompanionToggle<cr>", { noremap = true, silent = true })
    -- vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionAdd<cr>", { noremap = true, silent = true })
  end,
  keys = {
    {
      "<leader>ic",
      "<cmd>CodeCompanionToggle<CR>",
      desc = "A[I] [C]hat",
      mode = { "n", "v" },
    },
    {
      "<leader>ia",
      desc = "A[I] [A]sk",
    },
    {
      "<leader>iae",
      "<cmd>CodeCompanion /explain<CR>",
      desc = "A[I] [A]sk to [E]xplain",
      mode = { "n", "v" },
    },
    {
      "<leader>iaf",
      "<cmd>CodeCompanion /fix<CR>",
      desc = "A[I] [A]sk to [F]ix",
      mode = { "n", "v" },
    },
    {
      "<leader>iat",
      "<cmd>CodeCompanion /tests<CR>",
      desc = "A[I] [A]sk to create [T]tests",
      mode = { "n", "v" },
    },
    {
      "<leader>iad",
      function()
        vim.ui.input({ prompt = "what do you ask" }, function(input)
          vim.cmd("CodeCompanion /buffer " .. input)
        end)
      end,
      desc = "A[I] [A]sk to [D]o with a prompt [ga accept|gr reject]",
      mode = { "n", "v" },
    },
    {
      "<leader>ial",
      "<cmd>CodeCompanion /lsp<CR>",
      desc = "A[I] [A]sk to explain [L]sp diagnostics",
      mode = { "n", "v" },
    },
    {
      "<leader>ial",
      "<cmd>CodeCompanion /commit<CR>",
      desc = "A[I] [A]sk to generate a [C]ommit message",
      mode = { "n", "v" },
    },
    -- /explain - Explain how selected code in a buffer works
    -- /tests - Generate unit tests for selected code
    -- /fix - Fix the selected code
    -- /buffer - Send the current buffer to the LLM alongside a prompt
    -- /lsp - Explain the LSP diagnostics for the selected code
    -- /commit - Generate a commit message
    {
      "<leader>il",
      "<cmd>CodeCompanionActions<CR>",
      desc = "A[I] [L]ist of actions",
      mode = { "n", "v" },
    },
    {
      "<leader>il",
      "<cmd>CodeCompanionAdd<CR>",
      desc = "A[I] [I]ntegrate chat",
      mode = { "v" },
    },
  },
}
