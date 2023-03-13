return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      top_down = true,
      timeout = 100,
      stages = "fade",
    })
    vim.notify = require("notify")
  end,
}
