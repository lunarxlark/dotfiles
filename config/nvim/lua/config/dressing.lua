local dressing_ok, dressing = pcall(require, "dressing")
if not dressing_ok then
  vim.notify("'dressing' not found", "warn")
  return
end

dressing.setup()
