return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,
      segments = {
        -- fold
        -- { text = { "%C" }, click = "v:lua.ScFa" },
        { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        -- signs
        -- { text = { "%s" }, click = "v:lua.ScSa" },
        -- {
        --   sign = { name = { "Diagnostic" }, maxwidth = 2 },
        --   click = "v:lua.ScSa",
        -- },
        {
          sign = { namespace = { "diagnostic/signs" }, colwidth = 2, maxwidth = 3, auto = false },
          click = "v:lua.ScSa",
        },
        {
          sign = { name = { "Dap*" }, auto = true },
          click = "v:lua.ScSa",
        },
        --
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        },
        {
          sign = { namespace = { "gitsign*" } },
          click = "v:lua.ScSa",
        },
      },
    })
  end,
}
