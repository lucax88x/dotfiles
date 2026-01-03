return {
  "folke/sidekick.nvim",

  lazy = true,
  ---@class sidekick.Config
  opts = {},
  keys = {
    {
      "<Tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if require("sidekick").nes_jump_or_apply() then
          return -- jumped or applied
        end

        -- if you are using Neovim's native inline completions
        if vim.lsp.inline_completion.get() then
          return
        end

        -- any other things (like snippets) you want to do on <tab> go here.

        -- fall back to normal tab
        return "<tab>"
      end,
      mode = { "i", "n" },
      expr = true,
      desc = "sidekick: goto/apply next edit suggestion",
    },
    {
      -- "<C-n>",
      "<C-space>",
      function()
        require("sidekick.nes").update()
      end,
      mode = { "i", "n" },
      desc = "sidekick: request next edit suggestion",
    },
    {
      "<C-e>",
      function()
        require("sidekick.nes").clear()
      end,
      mode = { "i", "n" },
      desc = "sidekick: clear next edit suggestion",
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle()
      end,
      desc = "sidekick: toggle cli",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "sidekick: select cli",
    },
    {
      "<leader>at",
      function()
        require("sidekick.cli").send({ msg = "{this}" })
      end,
      mode = { "x", "n" },
      desc = "sidekick: send this",
    },
    {
      "<leader>av",
      function()
        require("sidekick.cli").send({ msg = "{selection}" })
      end,
      mode = { "x" },
      desc = "sidekick: send visual selection",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "x" },
      desc = "sidekick: select prompt",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "sidekick: switch focus",
    },
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "claude", focus = true })
      end,
      desc = "sidekick: toggle claude",
    },
  },
}
