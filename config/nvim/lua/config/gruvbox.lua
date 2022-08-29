local called, gruvbox = pcall(require, "gruvbox")
if not called then
  return
end

gruvbox.setup({
  italic = false,
})

vim.cmd([[colorscheme gruvbox]])
