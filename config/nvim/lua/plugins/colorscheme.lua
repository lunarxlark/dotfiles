return {
  { "svrana/neosolarized.nvim" },
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavor = "macchiato",
      })
    end,
  },
  { "EdenEast/nightfox.nvim" },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
      require("gruvbox").setup({
        italic = false,
        overrides = {
          DiffAdd = { fg = "#182819", bg = "#b8bb26" },
          DiffChange = { fg = "#182819", bg = "#8ec07c" },
          DiffDelete = { fg = "#210A07", bg = "#fb4934" },
          DiffText = { fg = "#291F08", bg = "#fabd2f" },
        },
      })
      require("gruvbox").load()
    end,
  },
}
