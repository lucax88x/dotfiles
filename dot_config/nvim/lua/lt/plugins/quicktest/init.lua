return {
  "quolpr/quicktest.nvim",
  config = function()
    local qt = require("quicktest")

    qt.setup({
      -- Choose your adapter, here all supported adapters are listed
      adapters = {
        require("quicktest.adapters.golang")({
          additional_args = function(_)
            return { "-race", "-count=1" }
          end,
          -- bin = function(bufnr) return 'go' end
          -- cwd = function(bufnr) return 'your-cwd' end
        }),
        require("quicktest.adapters.vitest")({
          -- bin = function(bufnr) return 'vitest' end
          -- cwd = function(bufnr) return bufnr end
          -- config_path = function(bufnr) return 'vitest.config.js' end
        }),
      },
      -- split or popup mode, when argument not specified
      default_win_mode = "split",
      -- Baleia make coloured output. Requires baleia package
      use_baleia = true,
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "m00qek/baleia.nvim",
  },
  keys = {
    {
      "<leader>;r",
      function()
        local qt = require("quicktest")
        -- current_win_mode return currently opened panel, split or popup
        qt.run_line()
        -- You can force open split or popup like this:
        -- qt.run_line('split')
        -- qt.run_line('popup')
      end,
      desc = "Test [R]un Line",
    },
    {
      "<leader>;f",
      function()
        local qt = require("quicktest")

        qt.run_file()
      end,
      desc = "Test Run [F]ile",
    },
    {
      "<leader>;d",
      function()
        local qt = require("quicktest")

        qt.run_dir()
      end,
      desc = "Test Run [D]ir",
    },
    {
      "<leader>;l",
      function()
        local qt = require("quicktest")

        qt.run_all()
      end,
      desc = "Test Run [A]ll",
    },
    {
      "<leader>;t",
      function()
        local qt = require("quicktest")

        qt.run_previous()
      end,
      desc = "Test Run [P]revious",
    },
    {
      "<leader>;:",
      function()
        local qt = require("quicktest")

        qt.toggle_win("split")
      end,
      desc = "Test [T]oggle Window",
    },
    {
      "<leader>;c",
      function()
        local qt = require("quicktest")

        qt.cancel_current_run()
      end,
      desc = "Test [C]ancel Current Run",
    },
  },
}
