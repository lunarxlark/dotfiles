return {

  {
    -- colorscheme creation aid
    "rktjmp/lush.nvim",
    enabled = false,
  },

  {
    "EdenEast/nightfox.nvim",
    enabled = true,
    config = function()
      vim.cmd("colorscheme nordfox")
    end,
  },

  {
    "lunarxlark/futurefunk.nvim",
    dev = true,
    enabled = false,
    config = function()
      vim.cmd([[colorscheme futurefunk]])
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
    "b0o/incline.nvim",
    config = function()
      local function get_diagnostic_label(props)
        local icons = { error = "", warn = "", info = "", hint = "" }
        local label = {}
        for severity, icon in pairs(icons) do
          local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
          if n > 0 then
            table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
          end
        end
        if #label > 0 then
          table.insert(label, { "| " })
        end
        return label
      end
      local function get_git_diff(props)
        local icons = { added = "", changed = "", removed = "" }
        local labels = {}
        local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
        for name, icon in pairs(icons) do
          if tonumber(signs[name]) and signs[name] > 0 then
            table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
          end
        end
        if #labels > 0 then
          table.insert(labels, { "| " })
        end
        return labels
      end

      require("incline").setup({
        render = function(props)
          local buffer = {
            { get_diagnostic_label(props) },
            { get_git_diff(props) },
          }
          return buffer
        end,
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      vim.opt.listchars:append("eol:↴")

      require("indent_blankline").setup({
        show_end_of_line = false,
        space_char_blankline = " ",
        char = "┊",
        char_blankline = "",
        char_highlight_list = {
          -- "IndentBlanklineIndent1",
          -- "IndentBlanklineIndent2",
        },
        space_char_highlight_list = {
          --"IndentBlanklineIndent1",
          --"IndentBlanklineIndent2",
        },
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>tr", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtree toggle" } },
    },
    config = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        -- disable default keymap at 'H'
        -- wanto to use H as 'go to Header' (default vim keybind)
        vim.keymap.set("n", "H", "", { buffer = bufnr })
        vim.keymap.del("n", "H", { buffer = bufnr })
      end

      require("nvim-tree").setup({
        on_attach = on_attach,
      })
    end,
  },

  -- TODO : noice入れると起動画面が変わるのを直す
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
        presets = {
          lsp_doc_border = true,
        },
      })
      require("telescope").load_extension("notify")
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    enabled = false,
    config = function()
      require("zen-mode").setup({
        window = {
          options = {
            -- signcolumn = "no",      -- disable signcolumn
            -- number = false,         -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false,     -- disable cursorline
            -- cursorcolumn = false,   -- disable cursor column
            -- foldcolumn = "0",       -- disable fold column
            -- list = false,           -- disable whitespace characters
          },
        },
      })
    end,
  },

  {
    "simeji/winresizer",
    event = "BufReadPost",
    keys = {
      { "<leader><leader>r", "<cmd>WinResizerStartResize<CR>", { desc = "window resize start" } },
    },
  },
}
