return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    vim.treesitter.language.register("markdown", "octo")
    require("octo").setup()
  end,
}
