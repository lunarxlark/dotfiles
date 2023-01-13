local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({
  spec = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "SmiteshP/nvim-navic",
    "antoinemadec/FixCursorHold.nvim",

    -- lsp
    { "stevearc/dressing.nvim", event = "VeryLazy" },

    "simeji/winresizer",
    "kyoh86/vim-go-coverage",
    { "mechatroner/rainbow_csv", ft = { "csv", "tsv" } },
    { "moznion/vim-ltsv", ft = "ltsv" },

    { import = "plugins" },
  },
  dev = {
    path = "~/dev/src/github.com/lunarxlark",
  },
  install = { colorscheme = { "gruvfox" } },
  diff = {
    cmd = "diffview.nvim",
  },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
