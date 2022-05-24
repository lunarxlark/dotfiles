require("trouble").setup{
    position = "bottom",
    icon = true,
    indent_lines = false,
    fold_open = "",
    fold_closed = "",
    mode = "workspace_diagnostics",
    use_diagnostic_signs = true,
    action_keys = {
        close = "q",
        preview = "<C-p>",
        cancel = "<esc>",
    },
}
