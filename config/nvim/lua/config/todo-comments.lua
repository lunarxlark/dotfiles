local called, todo = pcall(require, "todo-comments")
if not called then
  return
end

todo.setup({
  signs = false,
  keywords = {
    DEBUG = { color = "error" },
  },
})
