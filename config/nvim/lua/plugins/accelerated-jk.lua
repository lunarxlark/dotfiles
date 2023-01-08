local M = {
  "rainbowhxch/accelerated-jk.nvim",
}

function M.config()
  require("accelerated-jk").setup({
    mode = "time_driven",
    accelation_limit = 350,
    acceleration_table = { 2, 3, 4, 5, 6, 7, 8, 9, 10 },
  })
end

function M.init()
  vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "move with accelerated-jk" })
  vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "move with accelerated-jk" })
end

return M
