return {
  "nvim-lua/plenary.nvim",

  -- require("lt.plugins.catppuccin"),
  require("lt.plugins.tokyonight"),

  -- icons
  require("lt.plugins.icons"),

  -- ui library
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },
  -- require("lt.plugins.edgy"),
  require("lt.plugins.focus"),
  require("lt.plugins.snacks"),
  -- require("lt.plugins.bufferline"),

  -- shortcuts
  require("lt.plugins.better-escape"),
  require("lt.plugins.which-key"),
  require("lt.plugins.mini-bracketed"),
  -- require("lt.plugins.hawtkeys"),

  -- Change surrounding marks
  require("lt.plugins.surround"),

  -- extends . repeat
  { "tpope/vim-repeat", event = "VeryLazy" },
  -- allows to move by camelCase with w e
  require("lt.plugins.camel-case-motion"),

  -- highlight matching words when cursor on it
  -- require("lt.plugins.illuminate"),
  -- disabled search highlight until next search
  { "romainl/vim-cool", event = "VeryLazy" },
  -- :S to replace with smartcase
  { "tpope/vim-abolish", event = "VeryLazy" },

  -- start screen & project management
  require("lt.plugins.alpha"),
  require("lt.plugins.session-manager"),

  -- scroll
  --[[ require("lt.plugins.neoscroll"), ]]
  require("lt.plugins.scrollbar"),

  -- treesitter
  require("lt.plugins.treesitter"),
  require("lt.plugins.treesitter-textobjects"),
  require("lt.plugins.mini-ai"),
  require("lt.plugins.treesitter-context"),
  require("lt.plugins.iswap"),

  -- git
  -- require("lt.plugins.fugitive"),
  --https://github.com/rafi/vim-config/blob/master/lua/rafi/plugins/git.lua
  require("lt.plugins.neogit"),
  require("lt.plugins.blame"),
  require("lt.plugins.gitsigns"),
  require("lt.plugins.diffview"),
  require("lt.plugins.tardis"),

  -- quick list
  require("lt.plugins.bqf"),

  -- navigation
  require("lt.plugins.flash"),

  -- fuzzy finder
  require("lt.plugins.fzf"),
  require("lt.plugins.advanced-git-search"),
  --

  -- search
  require("lt.plugins.grug-far"),
  require("lt.plugins.hlslens"),

  -- lsp
  require("lt.plugins.mason"),
  -- require("lt.plugins.mason-dap"),
  -- require("lt.plugins.mason-tools"),

  require("lt.plugins.lint"),
  require("lt.plugins.conform"),
  -- require("lt.plugins.typescript-tools"),
  require("lt.plugins.ts-error-translator"),
  require("lt.plugins.tsc"),
  -- lua
  require("lt.plugins.lazydev"),
  require("lt.plugins.trouble"),
  -- go structs
  require("lt.plugins.goplelements"),
  require("lt.plugins.lsp"),
  require("lt.plugins.fidget"),

  -- autocompletion
  require("lt.plugins.blink"),
  require("lt.plugins.luasnip"),
  require("lt.plugins.friendly_snippets"),

  -- snippets

  -- comments & annotation
  require("lt.plugins.neogen"),
  require("lt.plugins.todo-comments"),
  require("lt.plugins.ts-comments"),
  -- require("lt.plugins.mini-comments"),

  -- fold
  require("lt.plugins.ufo"),

  -- code helpers
  require("lt.plugins.quick-switcher"),
  require("lt.plugins.refactoring"),
  -- require("lt.plugins.tailwindcss"),

  -- tree
  require("lt.plugins.oil"),

  -- tests
  -- require("lt.plugins.quicktest"),
  require("lt.plugins.neotest-golang"),
  require("lt.plugins.neotest"),

  -- debugging
  require("lt.plugins.dap"),

  -- http
  require("lt.plugins.luarocks"),
  require("lt.plugins.rest"),

  -- ui
  require("lt.plugins.colorizer"),
  require("lt.plugins.modes"),
  require("lt.plugins.indent-blankline"),
  -- require("lt.plugins.neocomposer"),
  require("lt.plugins.inc_rename"),

  -- status bar
  require("lt.plugins.lualine"),
  require("lt.plugins.statuscol"),

  -- runner
  require("lt.plugins.overseer"),

  -- rest
  require("lt.plugins.dial"),
  require("lt.plugins.toggleterm"),
  -- AI
  require("lt.plugins.avante"),
  require("lt.plugins.sidekick"),
  -- require("lt.plugins.copilot"),
  require("lt.plugins.store"),
  -- require("lt.plugins.mcphub"),
  -- require("lt.plugins.minuet"),
  -- require("lt.plugins.llm"),

  -- renderer (markdown, plantuml, etc)
  require("lt.plugins.peek"),
  require("lt.plugins.obsidian"),
  require("lt.plugins.markview"),
  require("lt.plugins.bigfile"),

  -- require("lt.plugins.profile"),
}
