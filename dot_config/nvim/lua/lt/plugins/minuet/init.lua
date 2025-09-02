return {

  "milanglacier/minuet-ai.nvim",
  config = function()
    require("minuet").setup({
      provider = "claude",
      provider_options = {
        claude = {
          max_tokens = 1024,
          -- model = "claude-3-5-haiku-20241022",
          model = "claude-sonnet-4-20250514",
        },
      },
      virtualtext = {
        keymap = {
          -- accept whole completion
          accept = "<A-A>",
          -- accept one line
          accept_line = "<A-a>",
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = "<A-z>",
          -- Cycle to prev completion item, or manually invoke completion
          prev = "<A-[>",
          -- Cycle to next completion item, or manually invoke completion
          next = "<A-]>",
          dismiss = "<A-e>",
        },
      },
    })
  end,
}
