local present, gitsigns = pcall(require, "gitsigns")
if not present then
  return
end

gitsigns.setup({
  signcolumn = true,
  numhl = true,
  linehl = false,
  word_diff = false,
})
