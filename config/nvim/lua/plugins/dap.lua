local M = {
  "mfussenegger/nvim-dap",
  cmd = "DapContinue",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
  },
}

function M.config()
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
end

function M.init()
  --dap.set_log_level("TRACE")
  vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
  vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

  vim.keymap.set("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "continue (dap)" })
  vim.keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "step over (dap)" })
  vim.keymap.set("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "step into (dap)" })
  vim.keymap.set("n", "<F12>", "<cmd>DapStepOut()<CR>", { desc = "step out (dap)" })
  vim.keymap.set("n", "<leader>b", "<cmd>DapToggleBreakpoint<CR>", { desc = "toggle breakpoint (dap)" })

  vim.keymap.set("n", "<leader>D", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "toggle dap ui" })
  vim.keymap.set("n", "<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>", { desc = "show eval (dap)" })
end

return M
