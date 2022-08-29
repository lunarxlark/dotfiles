local present, dapgo = pcall(require, "dap-go")
if not present then
  return
end

dapgo.setup()

vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua require'dap-go'.debug_test()<CR>", { noremap = true, silent = true })
