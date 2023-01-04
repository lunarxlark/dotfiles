local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

local symbols = {

  error = { icon = " ", fg = "#fb4934" },
  warn = { icon = " ", fg = "#fe8019" },
  info = { icon = " ", fg = "#83a598" },
  hint = { icon = " ", fg = "#fabd2f" },
  success = { icon = "﫠" },
}

function M.config()
  require("lualine").setup({
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
        { "encoding" },
        {
          "fileformat",
          symbols = {
            unix = "",
            dos = "",
            mac = "",
          },
        },
      },
      lualine_c = {
        {
          "diff",
          colored = true,
          diff_color = {
            added = "GitSignsAdd",
            modified = "GitSignsChange",
            removed = "GitSignsDelete",
          },
          symbols = { added = "+", modified = "~", removed = "-" },
          source = nil,
        },
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
        { require("nvim-navic").get_location, cond = require("nvim-navic").is_available },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "quickfix", "toggleterm" },
  })
end

return M
