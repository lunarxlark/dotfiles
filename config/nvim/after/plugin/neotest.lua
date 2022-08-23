local present, neotest = pcall(require, "neotest")
if not present then
  return
end

local present, neotest_plenary = pcall(require, "neotest-plenary")
if not present then
  return
end

local present, neotest_go = pcall(require, "neotest-go")
if not present then
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

vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua require'neotest'.run.run()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tS", "<cmd>lua require'neotest'.summary.toggle()<CR>",
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require'neotest'.output.open({enter=true})<CR>",
  { noremap = true, silent = true })
