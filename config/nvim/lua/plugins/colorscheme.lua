return {
  { "svrana/neosolarized.nvim" },
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
