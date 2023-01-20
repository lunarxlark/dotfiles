return {
  {
    "lunarxlark/nightfox.nvim",
    config = function()
      require("nightfox").setup()
      vim.cmd([[colorscheme gruvfox]])
    end,
  },
}
