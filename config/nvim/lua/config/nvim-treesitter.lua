require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "comment",
    "bash",
    "cmake",
    "make",
    "dockerfile",
    "dot",
    "http",
    "html",
    "go",
    "gomod",
    "json",
    "jsonc",
    "lua",
    "php",
    "python",
    "regex",
    "tsx",
    "typescript",
    "toml",
    "svelte",
    "hcl",
    "vim",
    "yaml",
  },
  sync_install = true,
  highlight = {
    enable = true,
  },
  refactor = {
    highlight_definitions = { enable = true },
  },
  -- experimental
  indent = {
    enable = true,
  },
})
