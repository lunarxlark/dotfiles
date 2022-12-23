return {
  "williamboman/mason.nvim",

  config = function()
    require("mason").setup({
      install_root_dir = vim.fn.stdpath("data") .. "/mason",
    })
  end,
}
