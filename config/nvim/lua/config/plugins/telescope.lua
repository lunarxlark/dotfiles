local M = {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-github.nvim",
    "nvim-telescope/telescope-ghq.nvim",
    "delphinus/telescope-memo.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "lunarxlark/telescope-aws.nvim",
  },
}

function M.config()
  local actions = require("telescope.actions")
  local actions_layout = require("telescope.actions.layout")
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-y>"] = actions_layout.toggle_preview,
          ["<esc>"] = actions.close,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<C-l>"] = actions.smart_send_to_loclist + actions.open_loclist,
        },
      },
      color_devicons = true,
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.95,
          height = 0.95,
          preview_width = 0.60,
        },
      },
      prompt_position = "top",
      prompt_prefix = "🔍",
      preview = {
        timeout = 1000,
        hide_on_startup = false,
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  })

  telescope.load_extension("notify")
  telescope.load_extension("fzf")
  telescope.load_extension("gh")
  telescope.load_extension("ghq")
  telescope.load_extension("memo")
  telescope.load_extension("emoji")
  telescope.load_extension("aws")
end

function M.init()
  vim.keymap.set("n", "<leader>v", "<cmd>Telescope find_files cwd=$XDG_CONFIG_HOME/nvim<CR>", { silent = true })
  vim.keymap.set("n", ",f", "<cmd>Telescope find_files<cr>", { silent = true })
  vim.keymap.set("n", ",fb", "<cmd>Telescope find_browser<cr>", { silent = true })
  vim.keymap.set("n", ",rg", "<cmd>Telescope live_grep<cr>", { silent = true })
  vim.keymap.set("n", ",b", "<cmd>Telescope buffers<cr>", { silent = true })
  vim.keymap.set("n", ",sm", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true })
end

return M
