local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
  local nls = require("null-ls")
  nls.setup({
    on_attach = options.on_attach,
    sources = {
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
end

function M.has_formatter(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
