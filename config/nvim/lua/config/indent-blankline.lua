local ib_ok, indent_blankline = pcall(require, "indent_blankline")
if not ib_ok then
  vim.notify("'indent_blankline' not found", "warn")
  return
end

vim.opt.list = true -- 不可視文字を表示
vim.opt.listchars = {
  tab = ">-",
  trail = "-",
  extends = ">",
  precedes = "<",
}

vim.cmd([[highlight IndentBlanklineIndent1 guibg=#282828 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guibg=#3c3836 gui=nocombine]])
indent_blankline.setup({
  char = "",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
  },
  show_trailing_blankline_indent = false,
  show_current_context = true,
  show_current_context_start = true,
})
