local present, hop = pcall(require, "hop")
if not present then
  return
end

hop.setup()

local nmap = require("util.keymap").nmap
nmap("<leader><leader>b", "<cmd>HopWordBC<CR>")
nmap("<leader><leader>a", "<cmd>HopWordAC<CR>")
