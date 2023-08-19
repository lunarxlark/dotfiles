return {

  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    keys = {
      { "<leader>gb", '<cmd>lua require("gitsigns").blame_line({ full = true })<cr>', { desc = "git blame" } },
      { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", { desc = "git diff" } },
    },
    config = function()
      require("gitsigns").setup({
        signcolumn = true,
        numhl = true,
        linehl = false,
        word_diff = false,
      })
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", { desc = "execute lazygit" } },
    },
    config = function()
      -- require("telescope").load_extension("lazygit")
    end,
  },

  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = false,
      })
    end,
  },

  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("octo").setup()
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[;;]],
      })
    end,
  },

  {
    "iberianpig/tig-explorer.vim",
    enabled = false,
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    cmd = { "TigOpenProjectRootDir", "TigBlame" },
    keys = {
      { "<leader>Tg", "<cmd>TigOpenProjectRootDir<cr>", { desc = "tig open" } },
      { "<leader>Tc", "<cmd>TigOpenCurrentFile<cr>", { desc = "tig open %" } },
      { "<leader>Tb", "<cmd>TigBlame<cr>", { desc = "tig blame" } },
    },
  },

  {
    "epwalsh/obsidian.nvim",
    enabled = false,
    cmd = { "ObsidianNew", "ObsidianSearch", "ObsidianQuickSwitch" },
    config = function()
      require("obsidian").setup({
        dir = vim.fn.expand("$HOME/dev/src/github.com/lunarxlark/my-memo/vault"),
        completion = {
          nvim_cmp = true,
        },
        use_advanced_uri = true,
        disable_frontmatter = true,
        finder = "fzf-lua",
      })
    end,
  },
}
