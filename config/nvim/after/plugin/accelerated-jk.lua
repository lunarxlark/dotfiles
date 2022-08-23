local present, accele = pcall(require, "accelerated-jk")
if not present then
  return
end

vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

accele.setup({
  mode = 'time_driven',
  acceleration_table = { 2, 3, 5, 7, 10 },
})
