return {
  "phaazon/hop.nvim",

  event = "BufReadPost",
  keys = {
    { "f", "<cmd>HopChar1CurrentLineAC<CR>", { desc = "search char1 on in current line (forward)" } },
    { "F", "<cmd>HopChar1CurrentLineBC<CR>", { desc = "search char1 on in current line (beforeward)" } },
    { "<leader>w", "<cmd>HopWordAC<CR>", { desc = "search word (forward)" } },
    { "<leader>W", "<cmd>HopWordBC<CR>", { desc = "search word (backward)" } },
    { "<leader>c", "<cmd>HopWordCurrentLineAC<CR>", { desc = "search word in current line (forward)" } },
    { "<leader>C", "<cmd>HopWordCurrentLineBC<CR>", { desc = "search word in current line (forward)" } },
  },
  config = function()
    require("hop").setup()
  end,
}
