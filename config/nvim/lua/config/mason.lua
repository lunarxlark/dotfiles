local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup({
  install_root_dir = vim.fn.stdpath("data").."/mason",
})
