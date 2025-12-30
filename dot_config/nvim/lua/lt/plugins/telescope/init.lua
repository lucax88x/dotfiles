return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "aaronhallaert/advanced-git-search.nvim" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>/c", function() require("telescope.builtin").commands() end,        desc = "telescope: search commands" },
    { "<leader>/C", function() require("telescope.builtin").command_history() end, desc = "telescope: search command history" },
    { "<leader>sl", function() require("telescope.builtin").live_grep() end,       desc = "telescope: live grep" },
    {
      "<leader>sc",
      function()
        require("telescope.builtin").find_files({
          prompt = "< Config >",
          cwd = "$HOME/.config/nvim",
        })
      end,
      desc = "telescope: search neovim config"
    },
    { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "telescope: find files" },
    { "<leader>po", function() require("telescope.builtin").oldfiles() end,   desc = "telescope: find files" },
    { "<leader>pg", function() require("telescope.builtin").git_files() end,  desc = "telescope: find git files" },
    { "<leader>/h",  function() require("telescope.builtin").highlights() end,   desc = "telescope: search highlights" },
    { "<leader>/r",  function() require("telescope.builtin").registers() end,    desc = "telescope: search registers" },
    { "<leader>/M",  function() require("telescope.builtin").marks() end,        desc = "telescope: search marks" },
    { "<leader>/k",  function() require("telescope.builtin").keymaps() end,      desc = "telescope: search keymaps" },
    { "<leader>/t",  function() require("telescope.builtin").treesitter() end,   desc = "telescope: search treesitter" },
    { "<leader>/gb", function() require("telescope.builtin").git_branches() end, desc = "telescope: search git branches" },
    { "<leader>/gc", function() require("telescope.builtin").git_commits() end,  desc = "telescope: search git commits" },
    { "<leader>/gC", function() require("telescope.builtin").git_bcommits() end, desc = "telescope: search git buffer commits" },
    { "<leader>bc",  function() require("telescope.builtin").git_bcommits() end, desc = "telescope: search git buffer commits" },
    { "<leader>bl",  function() require("telescope.builtin").buffers() end,      desc = "telescope: search buffers" },
    { "<leader>//",  function() require("telescope.builtin").resume() end,       desc = "telescope: resume" },
    {
      "<leader>/m",
      "<cmd>Telescope macros<cr>",
      desc = "telescope: search macros"
    },
    {
      "<leader>/gr",
      function()
        require('telescope').extensions.advanced_git_search.checkout_reflog()
      end,
      desc = "telescope: git search checkout reflog"
    },
    {
      "<leader>/gdb",
      function()
        require('telescope').extensions.advanced_git_search.diff_branch_file()
      end,
      desc = "telescope: git search diff branch file"
    },
    {
      "<leader>/gdf",
      function()
        require('telescope').extensions.advanced_git_search.diff_commit_file()
      end,
      desc = "telescope: git search diff commit file"
    },
    {
      "<leader>/gdl",
      function()
        require('telescope').extensions.advanced_git_search.diff_commit_line()
      end,
      desc = "telescope: git search diff commit line"
    },
    {
      "<leader>/gl",
      function()
        require('telescope').extensions.advanced_git_search.search_log_content()
      end,
      desc = "telescope: git search log content"
    },
    {
      "<leader>/gL",
      function()
        require('telescope').extensions.advanced_git_search.search_log_content_file()
      end,
      desc = "telescope: git search log content file"
    },
    {
      "<leader>/m",
      "<cmd>Telescope macros<cr>",
      desc = "telescope: search macros"
    },
  },
  config = function()
    local telescope = require("telescope")

    local functions = require("lt.utils.functions")

    telescope.setup({
      defaults = {
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "bottom" },
      },
      pickers = {
        buffers = {
          sort_lastused = true,
          sort_mru = true,
          previewer = false,
          theme = "dropdown",
          ignore_current_buffer = true,
        },
        find_files = { theme = "dropdown", previewer = false },
        git_files = { theme = "dropdown", previewer = false },
        registers = { theme = "dropdown" },
        lsp_code_actions = {
          theme = "cursor",
          layout_config = {
            height = 12,
          },
        },
        lsp_range_code_actions = { theme = "cursor" },
        loclist = { previewer = false },
      },
      -- extensions = {
      --   fzf = {
      --     fuzzy = true,
      --     override_generic_sorter = false, -- override the generic sorter
      --     override_file_sorter = true,     -- override the file sorter
      --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      --     -- the default case_mode is "smart_case"
      --   },
      -- },
    })

    if functions.is_macunix() then
      telescope.load_extension("fzf")
    else
      vim.notify("not using fzf")
    end

    -- if pcall(require, "dap") then
    --   telescope.load_extension("dap")
    -- else
    --   vim.notify("telescope not using dap")
    -- end

    if pcall(require, "refactoring") then
      telescope.load_extension("refactoring")
    else
      vim.notify("telescope not using refactoring")
    end

    if pcall(require, "advanced_git_search") then
      telescope.load_extension("advanced_git_search")
    else
      vim.notify("telescope not using advanced_git_search")
    end

    -- if pcall(require, "NeoComposer") then
    --   telescope.load_extension('macros')
    -- else
    --   vim.notify("telescope not using neocomposer")
    -- end
  end,
}
