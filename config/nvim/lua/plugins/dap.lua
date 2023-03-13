return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
  },
  cmd = "DapContinue",
  config = function()
    vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
    require("dap-go").setup()
    require("dap.ext.vscode").load_launchjs()

    local dap = require("dap")

    dap.adapters.go = function(callback, config)
      local stdout = vim.loop.new_pipe(false)
      local handle
      local pid_or_err
      local port = 38697
      local opts = {
        stdio = { nil, stdout },
        args = { "dap", "-l", "127.0.0.1:" .. port },
        detached = true,
      }
      handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
        stdout:close()
        handle:close()
        if code ~= 0 then
          print("dlv exited with code", code)
        end
      end)
      assert(handle, "Error running dlv: " .. tostring(pid_or_err))
      stdout:read_start(function(err, chunk)
        assert(not err, err)
        if chunk then
          vim.schedule(function()
            require("dap.repl").append(chunk)
          end)
        end
      end)
      -- Wait for delve to start
      vim.defer_fn(function()
        callback({ type = "server", host = "127.0.0.1", port = port })
      end, 100)
    end

    dap.configurations.go = {
      {
        name = "Debug main.go",
        type = "go",
        request = "launch",
        --mode = "auto",
        program = "${workspaceFolder}/main.go",
      },
      -- works with go.mod packages and sub packages
      {
        name = "Debug test",
        type = "go",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      {
        -- configuration for debugging test files
        name = "Debug in dir",
        type = "go",
        request = "launch",
        mode = "test",
        program = "${fileDirname}/...",
      },
    }

    local dapui = require("dapui")
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
  end,
  keys = {
    { "<F5>",               "<cmd>DapContinue<CR>",                 { desc = "continue (dap)" } },
    { "<F10>",              "<cmd>DapStepOver<CR>",                 { desc = "step over (dap)" } },
    { "<F11>",              "<cmd>DapStepInto<CR>",                 { desc = "step into (dap)" } },
    { "<F12>",              "<cmd>DapStepOut()<CR>",                { desc = "step out (dap)" } },
    { "<leader>b",          "<cmd>DapToggleBreakpoint<CR>",         { desc = "toggle breakpoint (dap)" } },
    { "<leader>D",          "<cmd>lua require'dapui'.toggle()<CR>", { desc = "toggle dap ui" } },
    { "<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>",   { desc = "show eval (dap)" } },
  },
}
