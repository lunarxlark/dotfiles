local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

function M.config()
  require("lualine").setup({
    options = {
      icons_enabled = true,
      --theme = "gruvbox",
      theme = "auto",
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
        { "filetype", colored = true, icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, file_status = true },
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
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    extensions = { "quickfix", "toggleterm", "nvim-dap-ui" },
  })
end

return M
