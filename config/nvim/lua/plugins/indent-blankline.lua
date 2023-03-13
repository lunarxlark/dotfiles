return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  config = function()
    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup({
      show_end_of_line = false,
      space_char_blankline = " ",
      char = "┊",
      char_blankline = "",
      char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
      space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
      },
    })
  end,
}
