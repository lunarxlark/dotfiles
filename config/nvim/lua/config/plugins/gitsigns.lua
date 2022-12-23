local M = {
  "lewis6991/gitsigns.nvim",
}

function M.config()
  require("gitsigns").setup({
    signcolumn = true,
    numhl = true,
    linehl = false,
    word_diff = false,
  })
end

function M.init()
  vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line{full=true} end, {desc = "git blame"})
  vim.keymap.set("n", "<leader>gd", require("gitsigns").diffthis, {desc = "git diff"})
end

return M
