return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup({
        install_root_dir = vim.fn.stdpath("data") .. "/mason",
      })
    end,
  },

  {
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
          "lua_ls",
          "gopls",
          -- TODO:mason doesn't support delve.
          --"delve",
          "marksman",
          "intelephense",
          "pyright",
          "terraformls",
          "tsserver",
          "yamlls",
          "clangd",
          "dockerls",
          "sqls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "nanotee/sqls.nvim", ft = "sql" },
    },
    event = "BufReadPre",
    config = function()
      vim.lsp.set_log_level(vim.log.levels.OFF)
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })

      local lspconfig = require("lspconfig")
      local on_attach = function(client, bufnr)
        require("plugins.lsp.keys").on_attach(client, bufnr)
        if client.name == "sqls" then
          require("sqls").on_attach(client, bufnr)
        else
          require("plugins.lsp.format").on_attach(client, bufnr)
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
        "lua_ls",
        "gopls",
        "intelephense",
        "pyright",
        "terraformls",
        "yamlls",
        "clangd",
        "dockerls",
        "sqls",
        "tsserver",
        "marksman",
      }

      local load = function(server)
        local found, option = pcall(require, "config.plugins.lsp.servers." .. server)
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
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPost",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        sources = {
          -- git
          nls.builtins.code_actions.gitsigns,
          -- lua
          nls.builtins.formatting.stylua,
          -- go
          nls.builtins.formatting.goimports,
          nls.builtins.diagnostics.golangci_lint.with({
            diagnostics_format = "[#{s}] #{m}",
            args = { "run", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
          }),
          -- terraform
          nls.builtins.formatting.terraform_fmt,
          -- js,ts
          nls.builtins.formatting.prettier,
          nls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[#{s}] #{m}",
          }),
          nls.builtins.formatting.eslint_d,
          -- yaml
          -- nls.builtins.diagnostics.yamllint,
          -- nls.builtins.formatting.yamlfmt,
          -- github actions
          nls.builtins.diagnostics.actionlint,
        },
      })
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "BufReadPre",
  },
}
