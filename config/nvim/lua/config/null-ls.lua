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
      args = { "run", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
    }),
    -- terraform
    nullls.builtins.formatting.terraform_fmt,
    -- js,ts
    -- formatting.prettier,
    -- formatting.eslint,
  },
})
