local called, cmp = pcall(require, "cmp")
if not called then
  return
end

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        path = "[Path]",
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        -- vsnip = "[Vsnip]",
      })[entry.source.name]
      vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
      return vim_item
    end,
  },
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lsp" },
    -- { name = "vnip" },
    -- { name = "cmp_tabnine" },
  },
})
