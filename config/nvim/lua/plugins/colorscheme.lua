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
      })
      require("gruvbox").load()
    end,
  },
}
