local ok, gruvbox = pcall(require, "gruvbox")
if not ok then
  return
end

gruvbox.setup({
  italic = false,
})

vim.cmd([[colorscheme gruvbox]])
