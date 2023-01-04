local M = {
  "lukas-reineke/indent-blankline.nvim",
}

function M.config()
  vim.cmd([[highlight IndentBlanklineIndent1 guibg=#282828 gui=nocombine]])
  vim.cmd([[highlight IndentBlanklineIndent2 guibg=#3c3836 gui=nocombine]])
  require("indent_blankline").setup({
    char = "",
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
    },
    space_char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
    },
    show_trailing_blankline_indent = false,
    show_current_context = false,
    show_current_context_start = false,
  })
end

return M
