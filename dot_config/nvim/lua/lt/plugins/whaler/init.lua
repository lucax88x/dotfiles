return {
  "SalOrak/whaler",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    directories = {
      { path = "~/repos", alias = "repos" },
    },
    oneoff_directories = {
      { path = "~/.local/share/chezmoi/dot_config/nvim/", alias = "nvim" },
      { path = "~/.local/share/chezmoi", alias = "chezmoi/dotfiles directory" },
    },
    file_explorer = "oil",
    picker = "fzf_lua",
  },
  cmd = "Whaler",
  keys = {
    { "<leader>pp", "<cmd>Whaler<cr>", desc = "whaler: switch project" },
  },
}
