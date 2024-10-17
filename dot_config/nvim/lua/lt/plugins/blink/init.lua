return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",

  opts = {
    keymap = {
      show = "<C-space>",
      hide = "<C-e>",
      accept = { "<Enter>", "<Tab>" },
      select_prev = { "<Up>", "<C-p>" },
      select_next = { "<Down>", "<C-n>" },

      show_documentation = "<C-space>",
      hide_documentation = "<C-space>",
      scroll_documentation_up = "<C-b>",
      scroll_documentation_down = "<C-f>",

      snippet_forward = "<Tab>",
      snippet_backward = "<S-Tab>",
    },
    -- highlight = {
    --   use_nvim_cmp_as_default = true,
    -- },

    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } },
  },
}
