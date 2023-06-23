return {
  {
    -- colorscheme creation aid
    "rktjmp/lush.nvim",
  },
  {
    "EdenEast/nightfox.nvim",
    enabled = false,
    config = function()
      -- local palettes = {
      --   duskfox = {
      --     bg1 = "#040C1C",
      --   },
      -- }
      -- require("nightfox").setup({
      --   palettes = palettes,
      -- })
      -- vim.cmd("colorscheme duskfox")

      -- local palettes = {
      --   nordfox = {
      --     bg1 = "#040C1C",
      --   },
      -- }
      -- require("nightfox").setup({
      --   palettes = palettes,
      -- })
      -- vim.cmd("colorscheme nordfox")

      -- vim.cmd("colorscheme nightfox")
    end,
  },
  {
    "lunarxlark/futurefunk.nvim",
    dev = true,
    enabled = true,
    config = function()
      vim.cmd([[colorscheme futurefunk]])
    end,
  },
}
