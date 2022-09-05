local gruvbox_ok, gruvbox = pcall(require, "gruvbox")
if not gruvbox_ok then
  vim.notify("gruvbox' not found", "warn")
  return
end

gruvbox.setup({
  italic = false,
})

vim.cmd([[colorscheme gruvbox]])
