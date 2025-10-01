return {
  "fredrikaverpil/neotest-golang",
  version = "*", -- Optional, but recommended; track releases
  build = function()
    vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait() -- Optional, but recommended
  end,
}
