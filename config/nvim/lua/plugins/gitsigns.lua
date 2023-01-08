return {
  "lewis6991/gitsigns.nvim",

  event = "BufReadPre",
  keys = {
    { "<leader>gb", '<cmd>lua require("gitsigns").blame_line({ full = true })<cr>', { desc = "git blame" } },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "git diff" } },
  },
  opts = function()
    require("gitsigns").setup({
      signcolumn = true,
      numhl = true,
      linehl = false,
      word_diff = true,
    })
  end,
}
