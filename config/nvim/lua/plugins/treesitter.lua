return {
  {
    "nvim-treesitter/nvim-treesitter",
    dev = false,
    build = ":TSUpdate",
    config = function()
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
        sync_install = false,
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
    end,
  },

  {

    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup()
    end,
  },
}
