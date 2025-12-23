local functions = require("lt.utils.functions")

-- quit
vim.keymap.set("n", "Q", "<cmd>q<CR>", { desc = "Quits editor" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force quits editor" })

-- reload
vim.keymap.set("n", "<leader><CR>", functions.reload, { desc = "Reloads configuration" })

-- undo
vim.keymap.set("n", "<leader>u", function()
  vim.cmd("packadd nvim.undotree")
  vim.cmd("Undotree")
end, { desc = "Toggle undo history" })

-- move upper/down on visual
vim.keymap.set("v", "K", '<cmd>m "<-2<CR>gv=gv"', { desc = "Move upper on visual" })
vim.keymap.set("v", "J", '<cmd>m ">+1<CR>gv=gv"', { desc = "Move down on visual" })

-- deletes in visual
vim.keymap.set("v", "X", '"_d', { desc = "Deletes on visual" })

-- when going to next search, we center screen
vim.keymap.set("n", "n", "nzzzv", { desc = "When going to next search, we center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "When going to previous search, we center screen" })

-- buffers
vim.keymap.set("n", "<leader>bw", "<cmd>update<CR>", { desc = "Saves/writes/updates buffer" })
vim.keymap.set("n", "<leader>bW", "<cmd>update!<CR>", { desc = "Force save/write/update buffer" })

vim.keymap.set("n", "<leader>ww", function()
  vim.opt.wrap = not vim.o.wrap
end, { desc = "Toggles window wrap" })

vim.keymap.set("n", "<leader>wc", function()
  local current_level = vim.o.conceallevel + 1

  if current_level > 3 then
    current_level = 0
  end

  vim.opt.conceallevel = current_level
end, { desc = "Toggles conceal level" })
