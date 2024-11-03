return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- shows treesitter context in end of parenthesis
    "haringsrob/nvim_context_vt",
    "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = { "BufReadPost", "BufNewFile", "BufEnter" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "tsx",
        "lua",
        "json",
        "rust",
        "css",
        "scss",
        -- "ruby",
        "rasi",
        "python",
        "dockerfile",
        "bash",
        "c_sharp",
        "graphql",
        "vue",
        -- "svelte",
        "regex",
        "yaml",
        "go",
        "terraform",
        "vim",
        "markdown",
        "markdown_inline",
        "regex",
        "http",
        "nix",
      },
      highlight = {
        enable = true,
      },
      matchup = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>rp"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>rP"] = "@parameter.inner",
          },
        },
      },
      textsubjects = {
        enable = true,
        keymaps = {
          ["."] = "textsubjects-smart",
          [";"] = "textsubjects-container-outer",
          ["i;"] = "textsubjects-container-inner",
        },
      },
    })

    local r = require("lt.utils.remaps")

    r.noremap("n", "<leader>dtp", function()
      vim.treesitter.inspect_tree({ command = "botright 60vnew" })
    end, "Treesitter playground")

    r.noremap("n", "<leader>dtt", "<cmd>TSHighlightCapturesUnderCursor<CR>", "Shows highlight colors under cursor")

    r.map_virtual("zi", "Init selection")
    r.map_virtual("zi", "Expand node")
  end,
  build = function()
    vim.cmd([[TSUpdate]])
  end,
}
