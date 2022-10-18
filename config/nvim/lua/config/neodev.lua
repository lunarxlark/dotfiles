local neodev_ok, neodev = pcall(require, "neodev")
if not neodev_ok then
  vim.notify("'neodev' not found", "warn")
  return
end

neodev.setup({})
