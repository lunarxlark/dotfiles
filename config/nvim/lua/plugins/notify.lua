return {
  "rcarriga/nvim-notify",

  config = function()
    require("notify").setup({
      top_down = true,
      timeout = 100,
      stages = "fade",
      level = vim.log.levels.WARN,
    })
    vim.notify = require("notify")
  end,
}
