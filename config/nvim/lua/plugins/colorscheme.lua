return {
  { "svrana/neosolarized.nvim" },
  {
    "catppuccin/nvim",
    opts = function()
      require("catppuccin").setup({
        flavor = "macchiato",
      })
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   opts = function()
  --     require("nightfox").setup()
  --     require("nightfox").load()
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   opts = function()
  --     require("gruvbox").setup({
  --       italic = true,
  --       overrides = {
  --         -- DiffAdd = { fg = "#182819", bg = "#b8bb26" },
  --         -- DiffChange = { fg = "#182819", bg = "#8ec07c" },
  --         -- DiffDelete = { fg = "#210A07", bg = "#fb4934" },
  --         -- DiffText = { fg = "#291F08", bg = "#fabd2f" },
  --         -- GitSignsChangeLnInline = { fg = "#b8bb26", bg = "#182819" },
  --         -- GitSignsAddLnInline = { fg = "#b8bb26", bg = "#182819" },
  --       },
  --     })
  --     -- require("gruvbox").load()
  --   end,
  -- },
  {
    "nightfox.nvim",
    dev = true,
    opts = function()
      require("nightfox").setup()
      vim.cmd([[colorscheme gruvfox]])
    end,
  },
}
