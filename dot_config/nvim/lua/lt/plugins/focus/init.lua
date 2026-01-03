return {
  "nvim-focus/focus.nvim",
  version = false,
  opts = {
    autoresize = {
      minwidth = 0,
      minheight = 0,
    },
  },
  init = function()
    local ignore_filetypes = { "oil", "vscode-diff-viewer" }
    local ignore_buftypes = { "nofile", "prompt", "popup" }

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for BufType",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.b.focus_disable = true
        else
          vim.b.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for FileType",
    })
  end,

  keys = {
    { "<leader>wf", "<cmd>FocusToggle<cr>", desc = "window: toggle focus autoresize" },
    { "<leader>wn", "<cmd>FocusSplitNicely<cr>", desc = "window: split nicely (golden ratio)" },
    { "<leader>wc", "<cmd>FocusSplitCycle<cr>", desc = "window: cycle splits" },
    { "<leader>wC", "<cmd>FocusSplitCycle reverse<cr>", desc = "window: cycle splits (reverse)" },
    { "<leader>wW", "<cmd>FocusToggleWindow<cr>", desc = "window: toggle focus for current window" },
    { "<leader>wB", "<cmd>FocusToggleBuffer<cr>", desc = "window: toggle focus for current buffer" },
    { "<leader>wh", "<cmd>FocusSplitLeft<cr>", desc = "window: split left" },
    { "<leader>wj", "<cmd>FocusSplitDown<cr>", desc = "window: split down" },
    { "<leader>wk", "<cmd>FocusSplitUp<cr>", desc = "window: split up" },
    { "<leader>wl", "<cmd>FocusSplitRight<cr>", desc = "window: split right" },
    { "<leader>w=", "<cmd>FocusEqualise<cr>", desc = "window: equalise splits" },
    { "<leader>wm", "<cmd>FocusMaximise<cr>", desc = "window: maximise focused window" },
    { "<leader>wo", "<cmd>FocusMaxOrEqual<cr>", desc = "window: toggle maximise/equalise" },
  },
}
