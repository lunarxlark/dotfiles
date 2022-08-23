local present, trouble = pcall(require, "trouble")
if not present then
  return
end

trouble.setup({
  position = "bottom",
  icon = true,
  indent_lines = false,
  fold_open = "",
  fold_closed = "",
  mode = "workspace_diagnostics",
  use_diagnostic_signs = true,
  action_keys = {
    close = "q",
    preview = "<C-p>",
    cancel = "<esc>",
  },
})

vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { noremap=true,silent = true })
vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>TroubleRefresh<cr>", { noremap=true,silent = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { noremap=true,silent = true })
