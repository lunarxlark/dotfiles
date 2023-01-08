return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavor = "macchiato",
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup()
      vim.cmd([[colorscheme nordfox]])
    end,
  },
}
