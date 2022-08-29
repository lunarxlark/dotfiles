local present, dapui = pcall(require, "dapui")
if not present then
  return
end

vim.api.nvim_set_keymap("n", "<leader>D", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>",
  { noremap = true, silent = true })

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
    }, {
      elements = {
        "repl",
      },
      size = 0.3,
      position = "bottom",
    }
  }
})
