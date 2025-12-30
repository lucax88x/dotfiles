return {
  "aaronhallaert/advanced-git-search.nvim",
  keys = {
    {
      "<leader>g/r",
      function()
        require("advanced_git_search.fzf.pickers").checkout_reflog()
      end,
      desc = "advanced-git-search: checkout reflog",
    },
    {
      "<leader>g/db",
      function()
        require("advanced_git_search.fzf.pickers").diff_branch_file()
      end,
      desc = "advanced-git-search: diff branch file",
    },
    {
      "<leader>g/df",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_file()
      end,
      desc = "advanced-git-search: diff commit file",
    },
    {
      "<leader>g/dl",
      function()
        require("advanced_git_search.fzf.pickers").diff_commit_line()
      end,
      desc = "advanced-git-search: diff commit line",
    },
    {
      "<leader>g/l",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content()
      end,
      desc = "advanced-git-search: log content",
    },
    {
      "<leader>g/L",
      function()
        require("advanced_git_search.fzf.pickers").search_log_content_file()
      end,
      desc = "advanced-git-search: log content file",
    },
  },
  opts = {},
}
