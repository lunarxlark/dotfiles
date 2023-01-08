return {
  "numToStr/Comment.nvim",

  event = "BufReadPost",
  opts = function()
    require("Comment").setup()
  end,
}
