local present, dapgo = pcall(require, "dap-go")
if not present then
  return
end

dapgo.setup()

local nmap = require("util.keymap").nmap
nmap("<leader>td", "<cmd>lua require'dap-go'.debug_test()<CR>")
