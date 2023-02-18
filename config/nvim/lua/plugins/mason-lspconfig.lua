return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },

  event = "BufReadPost",
  config = function()
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "rust_analyzer",
        "gopls",
        -- TODO:mason doesn't support delve.
        --"delve",
        "intelephense",
        "pyright",
        "lua_ls",
        "terraformls",
        "tsserver",
        "yamlls",
        "clangd",
        "dockerls",
        "sqls",
      },
    })
  end,
}
