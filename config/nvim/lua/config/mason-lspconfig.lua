local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  vim.notify("'mason-lspconfig' not found", "warn")
  return
end

mason_lspconfig.setup({
  automatic_installation = true,
  ensure_installed = {
    "rust_analyzer",
    "gopls",
    "delve",
    "intelephense",
    "pyright",
    "sumneko_lua",
    "terraformls",
    "tsserver",
    "yamlls",
    "clangd",
    "dockerls",
    "sqls",
  },
})
