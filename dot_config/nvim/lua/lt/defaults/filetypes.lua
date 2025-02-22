vim.filetype.add({
  filename = {
    [".git/config"] = "gitconfig",
  },
  pattern = {
    [".*/.gitconfig-*"] = "gitconfig",
    [".*/.http"] = "http",
  },
})
