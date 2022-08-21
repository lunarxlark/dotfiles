local lsp_installer_dir = vim.fn.stdpath("data") .. "/lsp_servers"
require("nvim-lsp-installer").setup({
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

-- Setup language buffer auto-formatting sync
vim.cmd([[autocmd BufWritePre *.rs lua vim.lsp.buf.format {async = true }]])
vim.cmd([[autocmd BufWritePre *.php lua vim.lsp.buf.format { async = true ]])
vim.cmd([[autocmd BufWritePre *.py lua vim.lsp.buf.format { async = true }]])
vim.cmd([[autocmd BufWritePre *.lua lua vim.lsp.buf.format { async = true }]])
vim.cmd([[autocmd BufWritePre *.tf lua vim.lsp.buf.format { async = true }]])

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cl", "<cmd>lua vim.lsp.codelens.get()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>im", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>Sm", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ty", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

-- sumneko
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local sumneko_root_path = lsp_installer_dir .. "/sumneko_lua/extension/server/bin/"
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { sumneko_root_path .. "/lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
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
    },
  },
})

-- gopls
lspconfig.gopls.setup({
  on_attach = function(c, b)
    on_attach(c, b)
    require('inlay-hints').on_attach(c, b)
  end,
  capabilities = capabilities,
  cmd = { lsp_installer_dir .. "/gopls/gopls", "serve" },
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
      staticcheck = true,
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
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
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
  cmd = { lsp_installer_dir .. "/terraformls/terraform-ls", "serve" },
  filetypes = { "terraform" },
  flags = {
    debounce_text_changes = 150,
  },
})

-- tsserver
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { lsp_installer_dir .. "/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
})

-- yamlls
lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { lsp_installer_dir .. "/yamlls/node_modules/.bin/yaml-language-server", "--stdio" },
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
  cmd = { lsp_installer_dir .. "/sqls/sqls", "--config", "~/.config/sqls/config.yaml" },
  on_attach = function(c, b)
    on_attach(c, b)
    require('sqls').on_attach(c, b)
  end,
  capabilities = capabilities,
  filetypes = { "sql" },
})
