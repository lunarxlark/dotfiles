local M = {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = "BufReadPost",
}

function M.config()
  require("todo-comments").setup({
    signs = true,
    keywords = {
      DEBUG = { color = "error" },
    },
  })
end

function M.init()
  vim.keymap.set("n", ",t", "<cmd>TodoTelescope<CR>", {desc = "Search through all project todos with Telescope"})

  vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
  end, { desc = "Next todo comment" })

  vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
  end, { desc = "Previous todo comment" })
end

return M
