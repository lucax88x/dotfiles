-- https://github.com/neovide/neovide/issues/2620o
-- if vim.g.neovide then
-- vim.o.guifont = "JetBrains Mono:h22"
-- vim.g.neovide_cursor_trail_length = 0.05
vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_vfx_mode = "pixiedust"
-- vim.g.neovide_cursor_vfx_mode = "railgun"
-- vim.g.neovide_cursor_vfx_particle_speed = 10.0
-- vim.g.neovide_cursor_vfx_particle_lifetime = 3.2
--
--
local map = vim.keymap.set

local function neovideScale(amount)
  if not vim.g.neovide then
    return
  end

  local temp = vim.g.neovide_scale_factor + amount

  if temp < 0.5 then
    return
  end

  vim.g.neovide_scale_factor = temp
end

map("n", "<C-=>", function()
  neovideScale(0.1)
end)

map("n", "<C-->", function()
  neovideScale(-0.1)
end)

map("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1
end)
-- end
