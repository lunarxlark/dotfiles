return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        flavor = "macchiato",
      })
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     require("nightfox").setup()
  --     vim.cmd([[colorscheme nordfox]])
  --   end,
  -- },
  -- {
  --   "gruvbox.nvim",
  --   dev = true,
  --   config = function()
  --     require("gruvbox").setup()
  --     -- vim.cmd([[colorscheme nordfox]])
  --     -- vim.cmd([[colorscheme gruvfox]])
  --     require("gruvbox").load()
  --   end,
  -- },
  {
    "lunarxlark/nightfox.nvim",
    config = function()
      require("nightfox").setup()
      vim.cmd([[colorscheme gruvfox]])
    end,
  },
}
