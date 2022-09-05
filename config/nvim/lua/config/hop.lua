local hop_ok, hop = pcall(require, "hop")
if not hop_ok then
  vim.notify("'hop' not found", "warn")
  return
end

hop.setup()

local nmap = require("util.keymap").nmap
nmap("f", "<cmd>HopChar1CurrentLineAC<CR>")
nmap("F", "<cmd>HopChar1CurrentLineBC<CR>")
nmap("<leader>w", "<cmd>HopWordAC<CR>")
nmap("<leader>W", "<cmd>HopWordBC<CR>")
nmap("<leader>c", "<cmd>HopWordCurrentLineAC<CR>")
nmap("<leader>C", "<cmd>HopWordCurrentLineBC<CR>")
