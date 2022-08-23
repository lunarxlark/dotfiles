local present, dapui = pcall(require, "dapui")
if not present then
  return
end

dapui.setup()

vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>",
  { noremap = true, silent = true })
