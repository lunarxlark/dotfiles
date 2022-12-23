local M = {
  "phaazon/hop.nvim",
  event = "BufReadPost",
}

function M.config()
  require("hop").setup()
end

function M.init()
  vim.keymap.set("n", "f", "<cmd>HopChar1CurrentLineAC<CR>", { desc = "search char1 on in current line (forward)" })
  vim.keymap.set("n", "F", "<cmd>HopChar1CurrentLineBC<CR>", { desc = "search char1 on in current line (beforeward)" })
  vim.keymap.set("n", "<leader>w", "<cmd>HopWordAC<CR>", { desc = "search word (forward)" })
  vim.keymap.set("n", "<leader>W", "<cmd>HopWordBC<CR>", { desc = "search word (backward)" })
  vim.keymap.set("n", "<leader>c", "<cmd>HopWordCurrentLineAC<CR>", { desc = "search word in current line (forward)" })
  vim.keymap.set("n", "<leader>C", "<cmd>HopWordCurrentLineBC<CR>", { desc = "search word in current line (forward)" })
end

return M
