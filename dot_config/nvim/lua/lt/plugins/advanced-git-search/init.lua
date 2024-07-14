return {
  "aaronhallaert/advanced-git-search.nvim",
  keys = {
    {
      "<leader>g/r",
      function()
        require("advanced_git_search.fzf.pickers").checkout_reflog()
      end,
      desc = "Git Search: Checkout Reflog",
    },
    {
      "<leader>g/db",
      function()
        require("advanced_git_search.fzf.pickers").diff_branch_file()
      end,
      desc = "Git Search: Diff branch file",
    },
    {
      "<leader>g/df",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_file()
      end,
      desc = "Git Search: Diff commit file",
    },
    {
      "<leader>g/dl",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_line()
      end,
      desc = "Git Search: Diff commit line",
    },
    {
      "<leader>g/l",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content()
      end,
      desc = "Git Search: Log content",
    },
    {
      "<leader>g/L",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content_file()
      end,
      desc = "Git Search: Log content file",
    },
  },
  init = function()
    require("advanced_git_search.fzf").setup({})
  end,
}
