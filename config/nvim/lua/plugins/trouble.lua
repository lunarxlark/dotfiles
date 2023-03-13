return {
  "folke/trouble.nvim",
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>", { desc = "trouble toggle" } },
  },
  config = function()
    require("trouble").setup()
  end,
}
