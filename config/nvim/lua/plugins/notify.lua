return {
  "rcarriga/nvim-notify",

  config = function()
    require("notify").setup({
      top_down = true,
      background_colour = "#282828",
    })
    vim.notify = require("notify")
  end,
}
