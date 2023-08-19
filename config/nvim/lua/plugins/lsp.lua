local keymapping = function()
  local keymaps = {
    { "<leader>ss", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "lsp diagnostics" } },
    { "<leader>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "lsp diagnostics in loclist" } },
    { "<leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "lsp diagnostics goto prev" } },
    { "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "lsp diagnostics goto next" } },
    { "<leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "lsp hover" } },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "lsp code action" } },
    { "<leader>cl", "<cmd>lua vim.lsp.codelens.get()<CR>", { desc = "lsp codelens" } },
    { "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "lsp goto definition" } },
    { "<leader>im", "<cmd>Telescope lsp_implementations<CR>", { desc = "lsp goto implementations" } },
    { "<leader>sm", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "lsp document symbols" } },
    { "<leader>Sm", "<cmd>Telescope lsp_workspace_symbols<CR>", { desc = "lsp workspace symbols" } },
    { "<leader>rf", "<cmd>Telescope lsp_references<CR>", { desc = "lsp references" } },
    { "<leader>ty", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "lsp type definitions" } },
    { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "lsp rename" } },
  }

  for _, keymap in pairs(keymaps) do
    vim.keymap.set("n", keymap[1], keymap[2], keymap[3])
  end
end

local lspformat = function()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0
  vim.lsp.buf.format({
    bufnr = buf,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
  })
end

local formatting = function(client, bufnr)
  if
    (client.config and client.config.capabilities and client.config.capabilities.documentFormattingProvider == false)
    or not client.supports_method("textDocument/formatting")
  then
    return
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
    buffer = bufnr,
    callback = function()
      lspformat()
    end,
  })
end

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
          "lua_ls",
          "gopls",
          "terraformls",
          "dockerls",
          "kotlin_language_server",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/neodev.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    event = "BufReadPre",
    config = function()
      -- vim.lsp.set_log_level(vim.log.levels.DEBUG)
      vim.lsp.set_log_level(vim.log.levels.OFF)
      require("neodev").setup({
        library = { plugins = { "neotest" }, types = true },
      })

      local lspconfig = require("lspconfig")
      local options = {
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/documentSymbol") then
            require("nvim-navic").attach(client, bufnr)
          end
          keymapping()
          formatting(client, bufnr)
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        flags = {
          debounce_text_changes = 150,
        },
      }

      -- {{{ lua_ls
      lspconfig["lua_ls"].setup(vim.tbl_deep_extend("force", options, {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              checkThirdParty = false,
              preloadFileSize = 600,
              maxPreload = 3200,
              library = {
                vim.api.nvim_get_runtime_file("", true),
              },
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
      }))
      -- }}}

      -- {{{ gopls
      lspconfig["gopls"].setup(vim.tbl_deep_extend("force", options, {
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
            usePlaceholders = true,
            codelenses = {
              gc_details = true,
              generate = true,
              test = true,
              tidy = true,
              vendor = false,
              upgrade_dependency = true,
            },
          },
        },
      }))
      -- }}}

      -- {{{ tsserver
      lspconfig["tsserver"].setup(vim.tbl_deep_extend("force", options, {
        server = {},
      }))
      -- }}}

      -- {{{ terraformls
      lspconfig["terraformls"].setup(vim.tbl_deep_extend("force", options, {}))
      -- }}}

      -- {{{ kotlin_language_server
      lspconfig["kotlin_language_server"].setup(vim.tbl_deep_extend("force", options, {
        root_dir = require("lspconfig.util").root_pattern({ "settings.gradle", "settings.gradle.kts" }),
        settings = {
          initializationOptions = {
            storagePath = vim.fn.stdpath("cache") .. "/kotlin-language-server",
          },
        },
      }))
      -- }}}

      -- {{{ marksman
      lspconfig["marksman"].setup(vim.tbl_deep_extend("force", options, {}))
      -- }}}

      -- {{{ dockerls
      lspconfig["dockerls"].setup(vim.tbl_deep_extend("force", options, {}))
      -- }}}
      -- jsonls
      -- TODO

      -- {{{ yamlls
      lspconfig["yamlls"].setup(vim.tbl_deep_extend("force", options, {
        settings = {
          yaml = {
            keyOrdering = false,
            schemaStore = {
              enable = false,
              url = "",
            },
            customTags = {
              "!Ref",
              "!Sub",
              "!GetAtt",
            },
            schemas = require("schemastore").yaml.schemas({
              -- FIXME : CFnに対して動かない
              -- extra = {
              --   ["AWS CloudFormation"] = {
              --     description = "AWS CloudFormation",
              --     fileMatch = { "*.yaml" },
              --     name = "AWS CloudFormation",
              --     url = "https://raw.githubusercontent.com/awslabs/goformation/v5.2.9/schema/cloudformation.schema.json",
              --   },
              -- },
            }),
          },
        },
      }))
      -- }}}

      -- {{{ nixd
      lspconfig["nixd"].setup(vim.tbl_deep_extend("force", options, {
        settings = {
          nixd = {
            formatting = {
              command = "nixpkgs-fmt",
            },
          },
        },
      }))
      -- }}}
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPost",
    config = function()
      local nls = require("null-ls")
      nls.setup({
        timeout_ms = 30000000,
        sources = {
          -- # git
          nls.builtins.code_actions.gitsigns,
          -- # lua
          nls.builtins.formatting.stylua,
          -- # go
          nls.builtins.formatting.goimports,
          nls.builtins.diagnostics.golangci_lint.with({
            diagnostics_format = "[#{s}] #{m}",
            -- args = { "run", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
          }),
          -- # terraform
          nls.builtins.formatting.terraform_fmt,
          -- js,ts
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.eslint_d,
          nls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = "[#{s}] #{m}",
          }),
          -- # yaml
          -- nls.builtins.diagnostics.yamllint,
          -- nls.builtins.formatting.yamlfmt,
          -- # github actions
          nls.builtins.diagnostics.actionlint,
          -- # kotlin
          nls.builtins.formatting.ktlint,
          -- # docker
          nls.builtins.diagnostics.hadolint,
          -- # shellscript
          nls.builtins.diagnostics.shellcheck,
        },
      })
    end,
  },

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "trouble toggle" } },
    },
    config = function()
      require("trouble").setup()
    end,
  },

  -- for lsp code action menu
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup()
    end,
  },
}
