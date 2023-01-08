return {
  "akinsho/toggleterm.nvim",

  cmd = "ToggleTerm",
  opts = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
        width = 200,
        height = 90,
      },
    })
  end,
}
