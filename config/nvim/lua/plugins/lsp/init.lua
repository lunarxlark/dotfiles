local M = {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
}

function M.config()
  vim.lsp.set_log_level(vim.log.levels.OFF)

  require("neodev").setup()

  local lspconfig = require("lspconfig")

  local on_attach = function(client, bufnr)
    require("plugins.lsp.keys").setup(client, bufnr)
    require("plugins.lsp.format").setup(client, bufnr)
    if client.name == "sqls" then
      require("sqls").on_attach(client, bufnr)
    end
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  local servers = {
    "sumneko_lua",
    "gopls",
    "intelephense",
    "pyright",
    "terraformls",
    "yamlls",
    "clangd",
    "dockerls",
    "sqls",
    "tsserver",
  }

  local load = function(server)
    local found, option = pcall(require, "config.plugins.lsp.servers."..server)
    if found then
      return option
    end
    return {}
  end

  for _, server in ipairs(servers) do
    local opts = vim.tbl_deep_extend("force", {}, options, load(server) or {})
    if server == "tsserver" then
      lspconfig[server].setup({ server = opts })
    else
      lspconfig[server].setup(opts)
    end
  end

  require("plugins.null-ls").config(options)
end

return M
