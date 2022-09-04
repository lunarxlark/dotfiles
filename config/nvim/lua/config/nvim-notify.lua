local notify_called, notify = pcall(require, "notify")
if not notify_called then
  vim.notify("failed to load 'notify'")
  return
end

notify.setup({
  top_down = false,
})

vim.notify = notify
