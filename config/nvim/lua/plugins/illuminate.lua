return {
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    keys = {
      { "<leader>N", "<cmd>lua require('illuminate').goto_next_reference()<CR>", { desc = "next illuminated" } },
      { "<leader>P", "<cmd>lua require('illuminate').goto_prev_reference()<CR>", { desc = "prev illuminated" } },
    }
  }
}
