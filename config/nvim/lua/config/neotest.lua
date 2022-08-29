local called1, neotest = pcall(require, "neotest")
if not called1 then
  return
end

local called2, neotest_plenary = pcall(require, "neotest-plenary")
if not called2 then
  return
end

local called3, neotest_go = pcall(require, "neotest-go")
if not called3 then
  return
end

neotest.setup({
  icons = {
    running = "↻",
  },
  adapters = {
    neotest_plenary,
    neotest_go,
  },
  config = {
    floating = {
      border = "rounded",
      max_height = 0.5,
      max_width = 0.6,
    },
    strategies = {
      integrated = {
        width = 120,
        height = 40,
      },
    },
  },
})

local nmap = require("util.keymap").nmap
nmap("<leader>tn", "<cmd>lua require'neotest'.run.run()<CR>")
nmap("<leader>tf", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>")
nmap("<leader>tS", "<cmd>lua require'neotest'.summary.toggle()<CR>")
nmap("<leader>to", "<cmd>lua require'neotest'.output.open({enter=true})<CR>")
