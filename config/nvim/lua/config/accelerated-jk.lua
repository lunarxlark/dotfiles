vim.api.nvim_set_keymap("n", "j", "<Plug>(accelerated_jk_gj)", {})
vim.api.nvim_set_keymap("n", "k", "<Plug>(accelerated_jk_gk)", {})

require("accelerated-jk").setup({
	acceleration_table = { 5, 10, 20 },
})
