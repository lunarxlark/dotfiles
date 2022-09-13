local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
if not autotag_ok then
  vim.notify("'nvim-ts-autotag' not found", "warn")
  return
end

autotag.setup()
