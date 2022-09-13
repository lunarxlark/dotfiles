local nullls_ok, nullls = pcall(require, "null-ls")
if not nullls_ok then
  vim.notify("'null-ls' not found", "warn")
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
nullls.setup({
  -- debug = true,
  -- sync formatting on save
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
  sources = {
    -- lua
    nullls.builtins.formatting.stylua,
    -- go
    nullls.builtins.formatting.goimports,
    nullls.builtins.diagnostics.golangci_lint.with({
      diagnostics_format = "[#{s}] #{m}",
      args = { "run", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
    }),
    -- terraform
    nullls.builtins.formatting.terraform_fmt,
    -- js,ts
    nullls.builtins.diagnostics.eslint.with({
      diagnostics_format = "[#{s}] #{m}",
    }),
    -- nullls.builtins.formatting.prettierd,
    -- nullls.builtins.code_actions.eslint,
    -- nullls.builtins.diagnostics.eslint_d.with({
    --   diagnostics_format = "[#{s}] #{m}",
    -- }),
    -- nullls.builtins.formatting.eslint_d,
    -- yaml
    --nullls.builtins.diagnostics.yamllint,
    --nullls.builtins.formatting.yamlfmt,
    -- github actions
    nullls.builtins.diagnostics.actionlint,
  },
})
