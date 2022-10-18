local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
  vim.notify("'telescope' not found", "warn")
  return
end

local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local action_state = require("telescope.actions.state")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<c-y>"] = actions_layout.toggle_preview,
        ["<esc>"] = actions.close,
        ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
        ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
        -- ["<cr>"] = custom_actions.fzf_multi_select,
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
telescope.load_extension("notify")
telescope.load_extension("noice")
telescope.load_extension("aws")

local nmap = require("util.keymap").nmap
nmap("<leader>v", "<cmd>Telescope find_files cwd=$XDG_CONFIG_HOME/nvim<CR>")
nmap(",f", "<cmd>Telescope find_files<cr>")
nmap(",rg", "<cmd>Telescope live_grep<cr>")
nmap(",b", "<cmd>Telescope buffers<cr>")
nmap(",sm", "<cmd>Telescope lsp_document_symbols<cr>")
