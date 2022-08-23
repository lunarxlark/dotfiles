local present, indent_blankline = pcall(require, "indent-blankline")
if not present then
  return
end

vim.cmd([[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]])
