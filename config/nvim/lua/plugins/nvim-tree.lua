return {
  "nvim-tree/nvim-tree.lua",

  keys = {
    { "<leader>tr", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtree toggle" } },
  },
  config = function()
    require("nvim-tree").setup()
  end,
}
