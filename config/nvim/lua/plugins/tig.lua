return {
  "iberianpig/tig-explorer.vim",

  dependencies = {
    "rbgrouleff/bclose.vim",
  },
  cmd = { "TigOpenProjectRootDir", "TigBlame" },
  keys = {
    { "<leader>Tg", "<cmd>TigOpenProjectRootDir<cr>", { desc = "tig open" } },
    { "<leader>Tc", "<cmd>TigOpenCurrentFile<cr>", { desc = "tig open %" } },
    { "<leader>Tb", "<cmd>TigBlame<cr>", { desc = "tig blame" } },
  },
}
