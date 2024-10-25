return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",

  opts = {
    keymap = {
      show = "<C-space>",
      hide = "<C-e>",
      accept = { "<Tab>" },
      select_prev = { "<Up>", "<C-p>" },
      select_next = { "<Down>", "<C-n>" },

      show_documentation = "<C-space>",
      hide_documentation = "<C-space>",
      scroll_documentation_up = "<C-b>",
      scroll_documentation_down = "<C-f>",

      snippet_forward = "<Tab>",
      snippet_backward = "<S-Tab>",
    },

    highlight = {
      use_nvim_cmp_as_default = true,
    },

    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },

    windows = {
      autocomplete = {
        min_width = 20,
        max_width = 40,
        max_height = 15,
        border = "rounded",
        draw = "reversed",
        scrolloff = 2,
        direction_priority = { "s", "n" },
      },
      documentation = {
        min_width = 15,
        max_width = 50,
        max_height = 20,
        border = "rounded",
        direction_priority = {
          autocomplete_north = { "e", "w", "n", "s" },
          autocomplete_south = { "e", "w", "s", "n" },
        },
        auto_show = true,
        auto_show_delay_ms = 500,
        update_delay_ms = 100,
      },
    },
  },
}
