local called, toggleterm = pcall(require, "toggleterm")
if not called then
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
