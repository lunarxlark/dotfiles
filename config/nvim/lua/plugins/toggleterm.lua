return {
  "akinsho/toggleterm.nvim",

  config = function()
    require("toggleterm").setup({
      open_mapping = [[;;]],
      direction = "float",
      float_opts = {
        border = "curved",
        width = 200,
        height = 90,
      },
    })
  end,
}
