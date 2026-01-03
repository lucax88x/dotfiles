return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp",
  },
  opts = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  },
  -- nes handled by sidekick
  init = function()
    vim.g.copilot_nes_debounce = 500
  end,
  keys = {
    {
      "<leader>aCe",
      "<CMD>Copilot enable<CR>",
      desc = "copilot: enable",
    },
    {
      "<leader>aCd",
      "<CMD>Copilot disable<CR>",
      desc = "copilot: disable",
    },
  },
}
