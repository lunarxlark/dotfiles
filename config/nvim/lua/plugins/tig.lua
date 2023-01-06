return {
  "iberianpig/tig-explorer.vim",

  cmd = { "TigOpenProjectRootDir", "TigBlame" },
  dependencies = {
    "rbgrouleff/bclose.vim",
  },

  init = function()
    vim.keymap.set("n", "<leader>T", "<cmd>TigOpenProjectRootDir<cr>", { desc = "tig open" })
    vim.keymap.set("n", "<leader>Tc", "<cmd>TigOpenCurrentFile<cr>", { desc = "tig open %" })
    vim.keymap.set("n", "<leader>Tb", "<cmd>TigBlame<cr>", { desc = "tig blame" })
  end,
}
