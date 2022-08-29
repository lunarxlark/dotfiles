local called, nullls = pcall(require, "null-ls")
if not called then
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
nullls.setup({
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
    nullls.builtins.formatting.gofmt,
    nullls.builtins.formatting.goimports,
    nullls.builtins.diagnostics.staticcheck,
    -- terraform
    nullls.builtins.formatting.terraform_fmt,
  },
})
