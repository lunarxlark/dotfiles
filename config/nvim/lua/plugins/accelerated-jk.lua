return {
  "rainbowhxch/accelerated-jk.nvim",

  event = "BufReadPost",
  keys = {
    { "j", "<plug>(accelerated_jk_gj)", desc = "move with accelerated-jk" },
    { "k", "<plug>(accelerated_jk_gk)", desc = "move with accelerated-jk" },
  },
  config = function()
    require("accelerated-jk").setup({
      mode = "time_driven",
      accelation_limit = 350,
      acceleration_table = { 2, 3, 4, 5, 6, 7, 8, 9, 10 },
    })
  end,
}
