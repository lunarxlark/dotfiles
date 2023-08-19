return {

  {
    "ibhagwan/fzf-lua",
    enabled = false,
    dependencies = {
      { "junegunn/fzf", build = "./install --bin" },
    },
    event = "VimEnter",
    keys = {
      { "<leader>v", "<cmd>FzfLua files cwd=$XDG_CONFIG_HOME/nvim<cr>" },
      { ",f", "<cmd>FzfLua files<cr>" },
      { ",r", "<cmd>FzfLua oldfiles<cr>" },
      { ",g", "<cmd>FzfLua live_grep<cr>" },
      { ",G", "<cmd>FzfLua lgrep_curbuf<cr>" },
      { ",b", "<cmd>FzfLua buffers<cr>" },
    },
    config = function()
      local actions = require("fzf-lua").actions
      require("fzf-lua").setup({
        actions = {
          files = {
            ["default"] = actions.file_edit,
            ["ctrl-s"] = actions.file_split,
            ["ctrl-v"] = actions.file_vsplit,
            ["ctrl-Enter"] = actions.file_tabedit,
            ["ctrl-q"] = actions.file_sel_to_qf,
            ["ctrl-l"] = actions.file_sel_to_ll,
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VimEnter",
    keys = {
      { "<leader>v", "<cmd>Telescope find_files cwd=$XDG_CONFIG_HOME/nvim<cr>" },
      { ",f", "<cmd>Telescope find_files<cr>" },
      { ",r", "<cmd>Telescope oldfiles<cr>" },
      { ",g", "<cmd>Telescope live_grep<cr>" },
      { ",G", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
      { ",b", "<cmd>Telescope buffers<cr>" },
      { ",t", "<cmd>Telescope todo-comments<cr>" },
      { ",h", "<cmd>Telescope notify<cr>" },
    },
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
            },
            i = {
              ["<C-s>"] = actions.select_horizontal,
              ["<C-t>"] = actions.select_tab,

              ["<C-S-b>"] = actions.preview_scrolling_up,
              ["<C-S-f>"] = actions.preview_scrolling_down,

              ["<C-b>"] = actions.results_scrolling_up,
              ["<C-f>"] = actions.results_scrolling_down,
              ["<C-h>"] = actions.results_scrolling_left,
              ["<C-l>"] = actions.results_scrolling_right,
            },
          },
          winblend = 15,
          selection_caret = "> ",
          dynamic_preview_title = true,
        },
      })
    end,
  },
}
