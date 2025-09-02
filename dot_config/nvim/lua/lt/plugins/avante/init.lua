return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = true,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    behaviour = {
      auto_suggestions = false,
    },

    provider = "claude",
    providers = {
      claude = {
        endpoint = "https://api.anthropic.com",
        -- model = "claude-3-5-sonnet-20241022",
        model = "claude-sonnet-4-20250514",
        -- disable_tools = true,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
  },
  build = "make BUILD_FROM_SOURCE=true",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    -- {
    --   -- Make sure to set this up properly if you have lazy=true
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}
