return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    -- "Kaiser-Yang/blink-cmp-avante",
    "nvim-mini/mini.icons",
    -- "milanglacier/minuet-ai.nvim",
    "giuxtaposition/blink-cmp-copilot",
  },
  lazy = false,
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        -- window = {
        -- border = "single",
        -- },
      },
      ghost_text = {
        enabled = true,
      },
      -- Recommended to avoid unnecessary request, for minuet
      -- trigger = { prefetch_on_insert = false },

      menu = {
        -- border = "single",
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", "source_name", gap = 1 } },
        },
      },
    },

    cmdline = {
      enabled = true,
    },

    sources = {
      default = { "copilot", "lsp", "snippets", "buffer", "path" },

      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,

          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind

            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"

            for _, item in ipairs(items) do
              item.kind = kind_idx
              item.kind_icon = ""
              item.kind_name = "Copilot"
            end
            return items
          end,
        },
        -- codecompanion = {
        --   name = "CodeCompanion",
        --   module = "codecompanion.providers.completion.blink",
        --   enabled = true,
        -- },
      },
    },

    snippets = { preset = "luasnip" },

    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        "snippet_forward",
        function() -- sidekick next edit suggestion
          return require("sidekick").nes_jump_or_apply()
        end,
        function() -- if you are using Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },

      -- ["<A-y>"] = require("minuet").make_blink_map(),
    },
  },
}
