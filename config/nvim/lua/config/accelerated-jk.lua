local accelerated_ok, accelerated = pcall(require, "accelerated-jk")
if not accelerated_ok then
  vim.notify("'accelerated-jk' not found", "warn")
  return
end

accelerated.setup({
  mode = "time_driven",
  accelation_limit = 350,
  acceleration_table = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 },
})

local nmap = require("util.keymap").nmap
nmap("j", "<Plug>(accelerated_jk_gj)")
nmap("k", "<Plug>(accelerated_jk_gk)")
