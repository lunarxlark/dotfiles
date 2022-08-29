local present, hop = pcall(require, "hop")
if not present then
  return
end

hop.setup()

vim.api.nvim_set_keymap("n", "<leader><leader>b",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>a",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<CR>",
  { noremap = true, silent = true })
