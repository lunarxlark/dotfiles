return {
  "nvim-neotest/neotest",

  dependencies = {
    { "nvim-neotest/neotest-go", ft = "go" },
    { "nvim-neotest/neotest-plenary", ft = { "lua" } },
    { "haydenmeade/neotest-jest", ft = { "ts", "tsx" } },
  },
  keys = {
    { "<leader>tn", "<cmd>lua require'neotest'.run.run()<CR>", { desc = "run test" } },
    {
      "<leader>tf",
      "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>",
      { desc = "run tests in file" },
    },
    { "<leader>tS", "<cmd>lua require'neotest'.summary.toggle()<CR>", { desc = "toggle test summary" } },
    {
      "<leader>to",
      "<cmd>lua require'neotest'.output.open({enter=true})<CR>",
      { desc = "open test result" },
    },
  },
  config = function()
    require("neotest").setup({
      icons = {
        running = "↻",
      },
      adapters = {
        require("neotest-plenary"),
        require("neotest-go"),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
      },
      highlights = {},
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
    })
  end,
}
