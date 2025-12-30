return {
  "ibhagwan/fzf-lua",
  branch = "main",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    -- { "tpope/vim-fugitive" },
  },
  cmd = { "FzfLua" },
  keys = {
    {
      "<leader>/c",
      function()
        require("fzf-lua").commands()
      end,
      desc = "fzf: search commands",
    },
    {
      "<leader>/C",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "fzf: search command history",
    },
    {
      "<leader>sl",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "fzf: live grep",
    },
    {
      "<leader>sc",
      function()
        require("lt.plugins.fzf.functions").search_neovim_dotfiles()
      end,
      desc = "fzf: search neovim dotfiles",
    },
    {
      "<leader>sd",
      function()
        require("lt.plugins.fzf.functions").search_dotfiles()
      end,
      desc = "fzf: search dotfiles",
    },
    {
      "<leader>sC",
      function()
        require("fzf-lua").live_grep({
          prompt = "Config >",
          cwd = "$HOME/.local/share/chezmoi/dot_config/nvim",
        })
      end,
      desc = "fzf: live grep neovim config",
    },
    {
      "<leader>s~",
      function()
        require("fzf-lua").files({
          prompt = "Profile >",
          cwd = "$HOME",
        })
      end,
      desc = "fzf: search profile",
    },
    {
      "<leader>pf",
      function()
        require("fzf-lua").files()
      end,
      desc = "fzf: find files",
    },
    {
      "<leader>pF",
      function()
        require("lt.plugins.fzf.functions").search_project_files()
      end,
      desc = "fzf: find files in another project",
    },
    {
      "<leader>pd",
      function()
        local current_file_path = vim.fn.expand("%:p")
        local directory = vim.fn.fnamemodify(current_file_path, ":h")
        require("fzf-lua").files({
          prompt = "Navigation Bar >",
          cwd = directory,
        })
      end,
      desc = "fzf: navigation bar",
    },
    {
      "<leader>po",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "fzf: find files",
    },
    {
      "<leader>pg",
      function()
        require("fzf-lua").git_files()
      end,
      desc = "fzf: find git files",
    },
    {
      "<leader>/h",
      function()
        require("fzf-lua").highlights()
      end,
      desc = "fzf: search highlights",
    },
    {
      "<leader>/r",
      function()
        require("fzf-lua").registers()
      end,
      desc = "fzf: search registers",
    },
    {
      "<leader>/M",
      function()
        require("fzf-lua").marks()
      end,
      desc = "fzf: search marks",
    },
    {
      "<leader>/k",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "fzf: search keymaps",
    },
    {
      "<leader>/t",
      function()
        require("fzf-lua").treesitter()
      end,
      desc = "fzf: search treesitter",
    },
    {
      "<leader>g/b",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "fzf: search git branches",
    },
    {
      "<leader>g/c",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "fzf: search git commits",
    },
    {
      "<leader>g/C",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "fzf: search git buffer commits",
    },
    {
      "<leader>bc",
      function()
        require("fzf-lua").git_bcommits()
      end,
      desc = "fzf: search git buffer commits",
    },
    {
      "<leader>bl",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "fzf: search buffers",
    },
    {
      "<leader>//",
      function()
        require("fzf-lua").resume()
      end,
      desc = "fzf: resume",
    },
  },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["CTRL-Q"] = "select-all+accept",
        },
      },
      files = {
        git_icons = false,
        formatter = "path.filename_first",
      },
    })

    -- snacks
    -- require("fzf-lua").register_ui_select()
  end,
}
