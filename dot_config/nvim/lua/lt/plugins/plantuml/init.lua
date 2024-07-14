return {
  "https://gitlab.com/itaranto/plantuml.nvim",
  version = "*",
  cmd = "PlantUML",
  config = function()
    require("plantuml").setup({
      renderer = {
        type = "image",
        options = {
          prog = "open -a Preview",
        },
      },
    })
  end,
}
