local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<c-p>"] = actions_layout.toggle_preview,
                ["<esc>"] = actions.close
            },
        },
        file_ignore_patterns = {'.git/*', 'node_modules/*', '.terraform/*'},
        color_devicons = true,
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        prompt_position = 'top',
        preview = {
            timeout = 1000,
            hide_on_startup = true
        }
    }
}

require('telescope').load_extension('gh')
require('telescope').load_extension('memo')
