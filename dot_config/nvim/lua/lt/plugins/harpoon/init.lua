return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>qq",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():add()
      end,
      desc = "Append to harpoon",
    },
    {
      "<leader>ql",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Toggle Quick Menu harpoon",
    },
    {
      "<leader>q1",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(1)
      end,
      desc = "Select harpoon 1",
    },
    {
      "<leader>q!",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():replace_at(1)
      end,
      desc = "Replace harpoon 1",
    },
    {
      "<leader>q2",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(2)
      end,
      desc = "Select harpoon 2",
    },
    {
      "<leader>q@",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():replace_at(2)
      end,
      desc = "Replace harpoon 2",
    },
    {
      "<leader>q3",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(3)
      end,
      desc = "Select harpoon 3",
    },
    {
      "<leader>q#",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():replace_at(3)
      end,
      desc = "Replace harpoon 3",
    },
    {
      "<leader>q4",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():select(4)
      end,
      desc = "Select harpoon 4",
    },
    {
      "<leader>q$",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():replace_at(4)
      end,
      desc = "Replace harpoon 4",
    },
    {
      "<leader>qx",
      mode = { "n" },
      function()
        local harpoon = require("harpoon")
        harpoon:list():clear()
      end,
      desc = "Clear",
    },
    -- {
    --   "<C-S-P>",
    --   mode = { "n" },
    --   function()
    --     local harpoon = require("harpoon")
    --     harpoon:list():prev()
    --   end,
    --   desc = "Select Previous Harpoon Buffer",
    -- },
    -- {
    --   "<C-S-N>",
    --   mode = { "n" },
    --   function()
    --     local harpoon = require("harpoon")
    --     harpoon:list():next()
    --   end,
    --   desc = "Select Next Harpoon Buffer",
    -- },
  },
  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()
  end,
}
