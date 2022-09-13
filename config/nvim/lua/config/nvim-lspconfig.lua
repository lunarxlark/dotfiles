local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_ok then
  vim.notify("'lspconfig' not found", "warn")
  return
end

local luadev_ok, luadev = pcall(require, "lua-dev")
if not luadev_ok then
  vim.notify("'lua-dev' not found", "warn")
  return
end

local cmp_lsp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_lsp_ok then
  vim.notify("'cmp_nvim_lsp' not found", "warn")
  return
end

local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then
  vim.notify("'navic' not found", "warn")
  return
end

local mason_pkg_dir = vim.fn.stdpath("data") .. "/mason/packages"
local mason_bin_dir = vim.fn.stdpath("data") .. "/mason/bin"

local capabilities = cmp_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

  local nmap = require("util.keymap").nmap
  nmap("<leader>ss", "<cmd>lua vim.diagnostic.open_float()<CR>")
  nmap("<leader>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>")
  nmap("<leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  nmap("<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>")

  local bnmap = require("util.keymap").bnmap
  bnmap(bufnr, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  bnmap(bufnr, "<leader>cl", "<cmd>lua vim.lsp.codelens.get()<CR>")
  bnmap(bufnr, "<leader>df", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bnmap(bufnr, "<leader>im", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bnmap(bufnr, "<leader>Sm", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
  bnmap(bufnr, "<leader>rf", "<cmd>lua vim.lsp.buf.references()<CR>")
  bnmap(bufnr, "<leader>ty", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  bnmap(bufnr, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bnmap(bufnr, "<leader>ho", "<cmd>lua vim.lsp.buf.hover()<CR>")

  if client.supports_method("textDocument/documentSymbol") then
    navic.attach(client, bufnr)
  end
end

-- sumneko
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local sumneko_root_path = mason_pkg_dir .. "/lua-language-server/extension/server/bin"

local luadev_settings = luadev.setup({
  lspconfig = {
    cmd = { sumneko_root_path .. "/lua-language-server", "-E", sumneko_root_path .. "/main.lua" },
    capabilities = capabilities,
    on_attach = on_attach,
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
  },
})

lspconfig.sumneko_lua.setup(luadev_settings)

-- gopls
lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("nvim-navic").attach(client, bufnr)
    require("inlay-hints").on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  cmd = { mason_bin_dir .. "/gopls", "serve" },
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
      --staticcheck = true, -- replace to golangci-lint by null-ls
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
        --assignVariableTypes = true,
        --compositeLiteralFields = true,
        --compositeLiteralTypes = true,
        constantValues = true,
        --functionTypeParameters = true,
        --parameterNames = true,
        --rangeVariableTypes = true,
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
  cmd = { mason_bin_dir .. "/sqls", "--config", vim.fn.stdpath("config") .. "/sqls/config.yaml" },
  on_attach = function(c, b)
    on_attach(c, b)
    require("sqls").on_attach(c, b)
  end,
  capabilities = capabilities,
  filetypes = { "sql" },
})
