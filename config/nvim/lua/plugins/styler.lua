return {
  "folke/styler.nvim",

  config = function()
    require("styler").setup({
      themes = {
        markdown = { colorscheme = "nordfox" },
        lua = { colorscheme = "nightfox" },
        help = { colorscheme = "nordfox" },
      },
    })
  end,
}
