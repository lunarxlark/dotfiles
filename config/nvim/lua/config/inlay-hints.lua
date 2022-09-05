local ih_ok, ih = pcall(require, "inlay-hints")
if not ih_ok then
  vim.notify("'inlay-hints' not found", "warn")
  return
end

ih.setup()
