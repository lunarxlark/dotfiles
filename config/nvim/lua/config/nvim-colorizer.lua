local colorizer_ok, colorizer = pcall(require, "colorizer")
if not colorizer then
  vim.notify("'nvim-colorizer' not found", "warn")
end

colorizer.setup({
  "css",
  "javascript",
})
