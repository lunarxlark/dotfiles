local present, lsp_installer = pcall(require, "nvim-lsp-installer")
if not present then
  return
end

local lsp_installer_dir = vim.fn.stdpath("data") .. "/lsp_servers"
vim.lsp.set_log_level("OFF")
lsp_installer.setup({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
  install_root_dir = lsp_installer_dir,
  max_concurrent_installers = 4,
  automatic_installation = true,
  ensure_installed = {
    "rust_analyzer",
    "gopls",
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
