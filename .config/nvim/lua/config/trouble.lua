require("trouble").setup{
    position = "right",
    icon = true,
    indent_lines = true,
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
