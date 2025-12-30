return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    -- shows treesitter context in end of parenthesis
    "haringsrob/nvim_context_vt",
    -- "RRethy/nvim-treesitter-textsubjects",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  keys = {
    {
      "<leader>dtp",
      function()
        vim.treesitter.inspect_tree({ command = "botright 60vnew" })
      end,
      desc = "treesitter: playground",
    },
    {
      "<leader>dtt",
      "<cmd>TSHighlightCapturesUnderCursor<CR>",
      desc = "treesitter: shows highlight colors under cursor",
    },
  },
  init = function()
    local function check_tree_sitter_cli()
      if vim.fn.executable("tree-sitter") == 0 then
        return false
      end
      return true
    end

    if not check_tree_sitter_cli() then
      vim.notify(
        "tree-sitter-cli is not installed. please install it",
        vim.log.levels.WARN,
        { title = "treesitter CLI missing" }
      )

      return
    end

    local treesitter = require("nvim-treesitter")

    treesitter.install({
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
    })

    --   highlight = {
    --     enable = true,
    --   },
    --   matchup = {
    --     enable = true,
    --   },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = "<C-space>",
    --       node_incremental = "<C-space>",
    --       scope_incremental = false,
    --       node_decremental = "<bs>",
    --     },
    --   },
    --   textobjects = {
    --     move = {
    --       enable = true,
    --       goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
    --       goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
    --       goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
    --       goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
    --     },
    --     swap = {
    --       enable = true,
    --       swap_next = {
    --         ["<leader>rp"] = "@parameter.inner",
    --       },
    --       swap_previous = {
    --         ["<leader>rP"] = "@parameter.inner",
    --       },
    --     },
    --   },
    --   textsubjects = {
    --     enable = true,
    --     keymaps = {
    --       ["."] = "textsubjects-smart",
    --       [";"] = "textsubjects-container-outer",
    --       ["i;"] = "textsubjects-container-inner",
    --     },
    --   },
    -- })
    --
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "*" },
      callback = function(ctx)
        local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

        if not hasStarted then
          return
        end

        local noIndent = {}
        if not vim.list_contains(noIndent, ctx.match) then
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        end
      end,
    })
  end,
}
