return {
  "williamboman/mason.nvim",
  cmd = "Mason",

  opts = function()
    require("mason").setup({
      install_root_dir = vim.fn.stdpath("data") .. "/mason",
    })
  end,
}
