return {
  "ellisonleao/gruvbox.nvim",

  lazy = false,
  config = function()
    require("gruvbox").setup({
      italic = false,
    })
    require("gruvbox").load()
  end,
}
