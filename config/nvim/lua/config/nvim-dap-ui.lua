local called, dapui = pcall(require, "dapui")
if not called then
  return
end

local nmap = require("util.keymap").nmap
nmap("<leader>D", "<cmd>lua require'dapui'.toggle()<CR>")
nmap("<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>")

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "right",
    },
    {
      elements = {
        "repl",
      },
      size = 0.3,
      position = "bottom",
    },
  },
})
