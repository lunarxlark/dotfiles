local called, mason_lspconfig = pcall(require, "mason-lspconfig")
if not called then
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