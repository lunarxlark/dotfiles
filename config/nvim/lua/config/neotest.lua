local neotest_ok, neotest = pcall(require, "neotest")
if not neotest_ok then
  vim.notify("'neotest' not found", "warn")
  return
end

local neotest_plenary_ok, neotest_plenary = pcall(require, "neotest-plenary")
if not neotest_plenary_ok then
  vim.notify("'neotest-plenary' not found", "warn")
  return
end

local neotest_go_ok, neotest_go = pcall(require, "neotest-go")
if not neotest_go_ok then
  vim.notify("'neotest-go' not found", "warn")
  return
end

local neotest_jest_ok, neotest_jest = pcall(require, "neotest-jest")
if not neotest_jest_ok then
  vim.notify("'neotest-jest' not found", "warn")
  return
end

vim.cmd([[
  hi! link NeotestAdapterName GruvboxRedBold
  hi! link NeotestDir GruvboxAquaBold
  hi! link NeotestFile GruvboxAqua
  hi! link NeotestTarget GruvboxBlue
  hi! link NeotestTest GruvboxBlue
  hi! link NeotestNamespace GruvboxBlue
  hi! link NeotestPassed GruvboxGreen
  hi! link NeotestFailed GruvboxRed
  hi! link NeotestRunning GruvboxOrange
  hi! link NeotestSkipped GruvboxYellow
]])

neotest.setup({
  icons = {
    running = "↻",
  },
  adapters = {
    neotest_plenary,
    neotest_go,
    neotest_jest({
      jestCommand = "npm test --",
      jestConfigFile = "jest.config.js",
      env = { CI = true },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }),
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
