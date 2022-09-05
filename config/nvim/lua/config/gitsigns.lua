local gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_ok then
  vim.notify("'gitsigns' not found", "warn")
  return
end

gitsigns.setup({
  signcolumn = true,
  numhl = true,
  linehl = false,
  word_diff = false,
})
