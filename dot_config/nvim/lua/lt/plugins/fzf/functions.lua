local M = {}

function M.search_config()
  require("fzf-lua").files({
    prompt = "< Config >",
    cwd = "$HOME/.local/share/chezmoi/dot_config/nvim",
  })
end

return M
