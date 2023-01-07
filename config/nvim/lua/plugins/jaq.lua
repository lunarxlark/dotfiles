return {
  "is0n/jaq-nvim",

  keys = {
    { "<leader>jq", "<cmd>Jaq<CR>", { desc = "run jaq" } },
  },
  config = function()
    require("jaq-nvim").setup({
      cmds = {
        external = {
          c = "gcc main.c && ./a.out",
          go = "go run ./...",
          javascript = "node %",
          php = "php %",
        },
      },
      ui = {
        startinsert = false, -- Start in insert mode
        wincmd = false, -- Switch back to current file. after using Jaq
        float = {
          border = "rounded", -- Floating window border (see ':h nvim_open_win')
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.5,
          border_hl = "FloatBorder",
          float_hl = "Normal",
          blend = 0, -- Floating Window Transparency (see ':h winblend')
        },
      },
    })
  end,
}
