return {
  "epwalsh/obsidian.nvim",
  cmd = { "ObsidianNew", "ObsidianSearch" },
  config = function()
    require("obsidian").setup({
      dir = vim.fn.expand("$HOME/dev/src/github.com/lunarxlark/obsidian"),
      completion = {
        nvim_cmp = true,
      },
      notes_subdir = "note",
      daily_notes = {
        folder = "note/daily",
      },
      use_advanced_uri = true,
    })
  end,
}
