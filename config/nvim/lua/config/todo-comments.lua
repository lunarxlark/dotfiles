local todo_ok, todo = pcall(require, "todo-comments")
if not todo_ok then
  vim.notify("'todo-comments' not found", "warn")
  return
end

todo.setup({
  signs = false,
  keywords = {
    DEBUG = { color = "error" },
  },
})
