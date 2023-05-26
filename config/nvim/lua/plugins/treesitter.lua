return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
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
          "query",
          "kotlin",
          "regex",
          "markdown",
          "markdown_inline",
          "sql",
          "tsx",
          "javascript",
          "terraform",
          "typescript",
          "toml",
          "svelte",
          "hcl",
          "vim",
          "vimdoc",
          "yaml",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = {
          enable = true,
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    config = function()
      require("treesitter-context").setup()
    end,
  },

  {
    "nvim-treesitter/playground",
    keys = {
      { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<cr>" },
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      })
    end,
  },
}
