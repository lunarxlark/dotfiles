local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
  vim.notify("'toggleterm' not found", "warn")
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  direction = "float",
  float_opts = {
    border = "curved",
    width = 200,
    height = 90,
  },
})
