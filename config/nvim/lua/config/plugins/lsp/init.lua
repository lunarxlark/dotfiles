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
    require("config.plugins.lsp.keys").setup(client, bufnr)
    require("config.plugins.lsp.format").setup(client, bufnr)
    if client.name == "sqls" then
      require("sqls").on_attach(client, bufnr)
    end
  end

  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local mason_bin_dir = vim.fn.stdpath("data") .. "/mason/bin"

  -- sumneko
  lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        -- runtime = {
        --   version = "LuaJIT",
        --   path = runtime_path,
        -- },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          preloadFileSize = 600,
          maxPreload = 3200,
        },
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = "Replace",
        },
        format = {
          enable = false,
          defaultConfig = {
            indent_style = "space",
            indent_size = "2",
            continuation_indent_size = "2",
          },
        },
      },
    },
  })

  -- gopls
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    --cmd = { mason_bin_dir .. "/gopls", "serve" },
    flags = {
      debounce_text_changes = 150,
    },
    settings = {
      gopls = {
        analyses = {
          fieldalignment = false,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        completeUnimported = true,
        hoverKind = "SynopsisDocumentation",
        staticcheck = false, -- replace to golangci-lint by null-ls
        directoryFilters = { "-debug" },
        matcher = "fuzzy",
        usePlaceholders = true,
        codelenses = {
          gc_details = true,
          generate = true,
          test = true,
          tidy = true,
          vendor = false,
        },
      },
    },
  })

  -- intelephense
  lspconfig.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      intelephense = {
        stubs = {
          "bcmath",
          "bz2",
          "calendar",
          "Core",
          "curl",
          "date",
          "dba",
          "dom",
          "enchant",
          "fileinfo",
          "filter",
          "ftp",
          "gd",
          "gettext",
          "hash",
          "iconv",
          "imap",
          "intl",
          "json",
          "ldap",
          "libxml",
          "mbstring",
          "mcrypt",
          "mysql",
          "mysqli",
          "password",
          "pcntl",
          "pcre",
          "PDO",
          "pdo_mysql",
          "Phar",
          "readline",
          "recode",
          "Reflection",
          "regex",
          "session",
          "SimpleXML",
          "soap",
          "sockets",
          "sodium",
          "SPL",
          "standard",
          "superglobals",
          "sysvsem",
          "sysvshm",
          "tokenizer",
          "xml",
          "xdebug",
          "xmlreader",
          "xmlwriter",
          "yaml",
          "zip",
          "zlib",
          "wordpress",
          "woocommerce",
          "acf-pro",
          "wordpress-globals",
          "wp-cli",
          "genesis",
          "polylang",
        },
        files = { maxSize = 6000000 },
      },
    },
  })

  -- pyright
  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- terraformls
  lspconfig.terraformls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { mason_bin_dir .. "/terraform-ls", "serve" },
    filetypes = { "terraform" },
    flags = {
      debounce_text_changes = 150,
    },
  })

  -- tsserver
  lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { mason_bin_dir .. "/typescript-language-server", "--stdio" },
  })

  -- yamlls
  lspconfig.yamlls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { mason_bin_dir .. "/yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
  })

  -- clangd
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- dockerls
  lspconfig.dockerls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "dockerfile" },
  })

  -- sqls
  lspconfig.sqls.setup({
    cmd = { mason_bin_dir .. "/sqls", "--config", vim.fn.stdpath("data") .. "/sqls/config.yaml" },
    root_dir = lspconfig.util.find_git_ancestor,
    on_attach = function(c, b)
      on_attach(c, b)
      require("sqls").on_attach(c, b)
    end,
    capabilities = capabilities,
  })

  ---@type _.lspconfig.options
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }

  require("config.plugins.null-ls").setup(options)
end

return M
