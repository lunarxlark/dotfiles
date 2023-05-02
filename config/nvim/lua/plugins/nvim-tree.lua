return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    { "<leader>tr", "<cmd>NvimTreeToggle<cr>", { desc = "nvimtree toggle" } },
  },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")
      -- local function opts(desc)
      --   return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      -- end
      api.config.mappings.default_on_attach(bufnr)

      vim.keymap.set('n', 'H', '', { buffer = bufnr })
      vim.keymap.del('n', 'H', { buffer = bufnr })
    end


    require("nvim-tree").setup({
      on_attach = on_attach
    })
  end,
}
