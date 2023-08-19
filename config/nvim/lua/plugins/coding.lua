return {

  {
    "phaazon/hop.nvim",
    event = "BufReadPost",
    keys = {
      { "<leader><leader>f", "<cmd>HopChar1CurrentLineAC<CR>", { desc = "search char1 on in current line (forward)" } },
      {
        "<leader><leader>F",
        "<cmd>HopChar1CurrentLineBC<CR>",
        { desc = "search char1 on in current line (beforeward)" },
      },
      { "<leader><leader>w", "<cmd>HopWordAC<CR>", { desc = "search word (forward)" } },
      { "<leader><leader>W", "<cmd>HopWordBC<CR>", { desc = "search word (backward)" } },
      { "<leader><leader>c", "<cmd>HopWordCurrentLineAC<CR>", { desc = "search word in current line (forward)" } },
      { "<leader><leader>C", "<cmd>HopWordCurrentLineBC<CR>", { desc = "search word in current line (forward)" } },
    },
    config = function()
      require("hop").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("todo-comments").setup({
        signs = true,
        keywords = {
          DEBUG = { color = "error" },
        },
      })
      require("telescope").load_extension("todo-comments")
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        remap = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },
    config = function()
      require("luasnip.loaders.from_lua").load({
        paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
      })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
      {
        "zbirenbaum/copilot-cmp",
        dependencies = {
          "zbirenbaum/copilot.lua",
        },
        config = function()
          require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = { gitcommit = true, markdown = true },
          })
          require("copilot_cmp").setup()
        end,
      },
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              copilot = "[Copilot]",
              nvim_lsp = "[LSP]",
              luasnip = "[Lsnip]",
              buffer = "[Buf]",
              path = "[Path]",
            })[entry.source.name]
            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
            return vim_item
          end,
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "RRethy/nvim-align",
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPost",
    config = function()
      require("colorizer").setup({
        "css",
        "tsx",
        "javascript",
        "lua",
        "toml",
        "noice",
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    keys = {
      { "<leader>N", "<cmd>lua require('illuminate').goto_next_reference()<CR>", { desc = "next illuminated" } },
      { "<leader>P", "<cmd>lua require('illuminate').goto_prev_reference()<CR>", { desc = "prev illuminated" } },
    },
  },
}
