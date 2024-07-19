local functions = require("lt.plugins.fzf.functions")

vim.keymap.set("n", "<leader>pp", function()
  functions.switch_project()
end, { desc = "Switch project" })
