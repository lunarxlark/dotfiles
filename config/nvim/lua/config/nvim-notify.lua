local notify_ok, notify = pcall(require, "notify")
if not notify_ok then
  vim.notify("'notify' not found", "warn")
  return
end

notify.setup({
  top_down = true,
  background_colour = "#282828",
})

vim.notify = notify
