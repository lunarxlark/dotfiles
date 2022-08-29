local present, accele = pcall(require, "accelerated-jk")
if not present then
  return
end

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

accele.setup({
  mode = "time_driven",
  accelation_limit = 350,
  acceleration_table = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },
})
