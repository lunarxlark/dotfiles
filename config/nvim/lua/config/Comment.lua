local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
  vim.notify("'Comment' not found", "warn")
  return
end

comment.setup()
