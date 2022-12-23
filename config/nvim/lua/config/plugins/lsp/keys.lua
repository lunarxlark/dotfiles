local M = {}

function M.setup(client, bufnr)
  vim.keymap.set("n", "<leader>ss", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "lsp diagnostics" })
  vim.keymap.set("n", "<leader>sd", "<cmd>lua vim.diagnostic.setloclist()<CR>", { desc = "lsp diagnostics in loclist" })
  vim.keymap.set("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "lsp diagnostics goto prev" })
  vim.keymap.set("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "lsp diagnostics goto next" })

  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>cl",
    "<cmd>lua vim.lsp.codelens.get()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>df",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>im",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>Sm",
    "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>rf",
    "<cmd>lua vim.lsp.buf.references()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>ty",
    "<cmd>lua vim.lsp.buf.type_definition()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>rn",
    "<cmd>lua vim.lsp.buf.rename()<CR>",
    { noremap = true, silent = true }
  )
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "<leader>ho",
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    { noremap = true, silent = true }
  )

  if client.supports_method("textDocument/documentSymbol") then
    require("nvim-navic").attach(client, bufnr)
  end
end

return M
