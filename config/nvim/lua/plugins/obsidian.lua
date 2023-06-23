return {
  "epwalsh/obsidian.nvim",
  config = function()
    require("obsidian").setup({
      dir = vim.fn.expand("$HOME/dev/src/github.com/lunarxlark/my-memo"),
      completion = {
        nvim_cmp = true,
      },
      notes_subdir = "note",
      daily_notes = {
        folder = "note/daily",
      },
      use_advanced_uri = true,
      finder = "fzf-lua",
    })
  end,
}
