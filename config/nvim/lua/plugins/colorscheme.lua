return {
  {
    -- colorscheme creation aid
    "rktjmp/lush.nvim"
  },
  {
    "lunarxlark/futurefunk.nvim",
    dev = true,
    config = function()
      vim.cmd([[colorscheme futurefunk]])
    end,
  },
}
