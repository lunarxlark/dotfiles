local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  require("mason-lspconfig").setup({
    automatic_installation = true,
    ensure_installed = {
      "rust_analyzer",
      "gopls",
      -- TODO:mason doesn't support delve.
      --"delve",
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
end

return M
