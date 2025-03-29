return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
  },
  cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
  -- build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
  keys = {
    {
      "<leader>am",
      "<cmd>MCPHub<cr>",
      desc = "MCP hub",
    },
  },
  config = function()
    require("mcphub").setup({
      port = 3000,
      config = vim.fn.expand("~/mcpservers.json"),
    })
  end,
}
