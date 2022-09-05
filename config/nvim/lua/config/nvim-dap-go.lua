local dap_go_ok, dapgo = pcall(require, "dap-go")
if not dap_go_ok then
  vim.notify("'dap-go' not found", "warn")
  return
end

dapgo.setup()

local nmap = require("util.keymap").nmap
nmap("<leader>td", "<cmd>lua require'dap-go'.debug_test()<CR>")
