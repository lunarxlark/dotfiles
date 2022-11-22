local ts_config_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not ts_config_ok then
  vim.notify("'nvim-treesitter.configs' not found", "warn")
  return
end

ts_config.setup({
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
    "markdown",
    "markdown_inline",
    "sql",
    "tsx",
    "javascript",
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
