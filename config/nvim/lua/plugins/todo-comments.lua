return {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "BufReadPost",

  keys = {
    { ",t", "<cmd>TodoTelescope<CR>", { desc = "Search through all project todos with Telescope" } },
    { "]t", '<cmd>lua require("todo-comments").jump_next()<cr>', { desc = "Next todo comment" } },
    { "[t", '<cmd>lua require("todo-comments").jump_prev()<cr>', { desc = "Previous todo comment" } },
  },
  config = function()
    require("todo-comments").setup({
      signs = true,
      keywords = {
        DEBUG = { color = "error" },
      },
    })
  end,
}
