return {
  {
    "kdheepak/tabline.nvim",

    keys = {
      { "<leader><leader>n", "<cmd>TablineBufferNext<cr>" },
      { "<leader><leader>p", "<cmd>TablineBufferPrevious<cr>" },
      { "<leader><leader>t", "<cmd>TablineTabNew<cr>" },
    },
    event = "VimEnter",
    config = function()
      require("tabline").setup({
        options = {
          section_separators = { "", "" },
          component_separators = { "", "" },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "auto",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
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
    end,
  },
}
