local M = {}

M.nmap = function(key, cmd, opt)
  if opt == nil then
    opt = { noremap = true, silent = true }
  end
  vim.api.nvim_set_keymap("n", key, cmd, opt)
end

M.bnmap = function(bufnr, key, cmd, opt)
  if opt == nil then
    opt = { noremap = true, silent = true }
  end
  vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, opt)
end

return M
