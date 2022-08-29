local present, _ = pcall(require, "tig-explorer")
if not present then
  return
end

vim.api.nvim_set_keymap("n", "<leader>T", "<cmd>TigOpenProjectRootDir<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Tc", "<cmd>TigOpenCurrentFile<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Tb", "<cmd>TigBlame<cr>", { noremap = true, silent = true })
