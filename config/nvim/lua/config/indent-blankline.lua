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

indent_blankline.setup({
  char = "",
  char_highlight_list = {
    "GruvboxBg2",
    "GruvboxBg3",
  },
  space_char_blankline = " ",
  space_char_highlight_list = {
    "GruvboxBg2",
    "GruvboxBg3",
  },
})
