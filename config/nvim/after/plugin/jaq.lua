local present, jaq = pcall(require, "jaq-nvim")
if not present then
  return
end

jaq.setup({
  cmds = {
    external = {
      c = "gcc main.c && ./a.out",
      go = "go run ./...",
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

vim.api.nvim_set_keymap("n", "<leader>jq", "<cmd>Jaq<CR>", { noremap=true,silent = true })
