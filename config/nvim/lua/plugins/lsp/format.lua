local M = {}

M.autoformat = true

function M.format()
  local buf = vim.api.nvim_get_current_buf()
  if M.autoformat == false then
    return
  end
  local ft = vim.bo[buf].filetype
  local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0
  vim.lsp.buf.format({
    bufnr = buf,
    timeout_ms = 50000,
    filter = function(client)
      if have_nls then
        return client.name == "null-ls"
      else
        return client.name ~= "null-ls"
      end
    end,
  })
end

function M.on_attach(client, buf)
  if
      client.config
      and client.config.capabilities
      and client.config.capabilities.documentFormattingProvider == false
  then
    return
  end

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. buf, {}),
      buffer = buf,
      callback = function()
        if M.autoformat then
          M.format()
        end
      end,
    })
  end
end

return M
