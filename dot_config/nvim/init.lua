--  _                 _                     _
-- | |               | |                   (_)
-- | |_   _  ___ __ _| |_ _ __ __ _ _________
-- | | | | |/ __/ _` | __| '__/ _` |_  /_  / |
-- | | |_| | (_| (_| | |_| | | (_| |/ / / /| |
-- |_|\__,_|\___\__,_|\__|_|  \__,_/___/___|_|
--
if not vim.g.vscode then
  require("lt.defaults")
  require("lt.autocmds")
  require("lt.neovide")
  require("lt.lazy")
end
