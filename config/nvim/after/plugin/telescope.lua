local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<c-y>"] = actions_layout.toggle_preview,
        ["<esc>"] = actions.close,
      },
    },
    color_devicons = true,
    sorting_strategy = "ascending",
    layout_strategy = "flex",
    layout_config = {
      width = 0.95,
      height = 0.95,
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

telescope.load_extension("fzf")
telescope.load_extension("gh")
telescope.load_extension("ghq")
telescope.load_extension("memo")
telescope.load_extension("aws")


vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>Telescope find_files cwd=$XDG_CONFIG_HOME/nvim<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>Telescope find_files cwd=$GHQ_ROOT/github.com/lunarxlark/dotfiles<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",f", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",rg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",b", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sm", "<cmd>Telescope lsp_document_symbols<cr>", { noremap = true, silent = true })
