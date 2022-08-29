local called, _ = pcall(require, "tig-explorer")
if not called then
  return
end

local nmap = require("util.keymap").nmap
nmap("<leader>T", "<cmd>TigOpenProjectRootDir<cr>")
nmap("<leader>Tc", "<cmd>TigOpenCurrentFile<cr>")
nmap("<leader>Tb", "<cmd>TigBlame<cr>")
