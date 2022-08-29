local called, mason = pcall(require, "mason")
if not called then
  return
end

mason.setup({
  install_root_dir = vim.fn.stdpath("data") .. "/mason",
})
