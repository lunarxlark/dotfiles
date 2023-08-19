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

vim.api.nvim_set_keymap("n", "<leader>ls", "<cmd>Lazy sync<cr>", { desc = "lazy sync" })
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>Lazy profile<cr>", { desc = "lazy profile" })

require("lazy").setup({
  spec = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "SmiteshP/nvim-navic",

    { import = "plugins" },
  },
  dev = {
    path = "~/dev/src/github.com/lunarxlark",
  },
  install = { colorscheme = { "habamax" } },
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
        "editorconfig",
        "spellfile",
      },
    },
  },
})
