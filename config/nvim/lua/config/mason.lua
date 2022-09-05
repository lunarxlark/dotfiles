local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  vim.notify("'mason' not found", "warn")
  return
end

mason.setup({
  install_root_dir = vim.fn.stdpath("data") .. "/mason",
})
