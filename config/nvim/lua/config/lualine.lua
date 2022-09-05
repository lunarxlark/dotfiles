local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
  vim.notify("'lualine' not found", "warn")
  return
end

local navic_ok, navic = pcall(require, "nvim-navic")
if not navic_ok then
  vim.notify("'nvim-navic' not found", "warn")
  return
end

local symbols = {
  error = { icon = " ", fg = "#fb4934" },
  warn = { icon = " ", fg = "#fe8019" },
  info = { icon = " ", fg = "#83a598" },
  hint = { icon = " ", fg = "#fabd2f" },
  success = { icon = "﫠" },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox",
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dap-repl", "dapui_stacks", "dapui_watches", "dapui_scopes", "dapui_breakpoints" },
      winbar = { "dap-repl", "dapui_stacks", "dapui_watches", "dapui_scopes", "dapui_breakpoints" },
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = "" },
      -- { 'filetype', colored = true, icon_only = true },
      { "filename", file_status = true },
    },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn", "info", "hint" },
        symbols = {
          error = symbols.error.icon,
          warn = symbols.warn.icon,
          info = symbols.info.icon,
          hint = symbols.hint.icon,
        },
        colored = true,
        diagnostics_color = {
          error = { fg = symbols.error.fg },
          warn = { fg = symbols.warn.fg },
          info = { fg = symbols.info.fg },
          hint = { fg = symbols.hint.fg },
        },
        update_in_insert = false,
        always_visible = true,
      },
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {
      {
        "diff",
        colored = true,
        diff_color = {
          added = { "DiffAdd" },
          modified = { "DiffChange" },
          removed = { "DiffDelete" },
        },
        symbols = { added = "+", modified = "~", removed = "-" },
        source = nil,
      },
    },
    lualine_y = {
      {
        "fileformat",
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      "encoding",
    },
    lualine_z = {
      { "progress" },
      { "location" },
    },
  },
  extensions = { "quickfix", "toggleterm" },
})
