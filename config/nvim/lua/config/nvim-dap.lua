local dap_ok, dap = pcall(require, "dap")
if not dap_ok then
  vim.notify("'dap' not found", "warn")
  return
end

--dap.set_log_level("TRACE")
vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

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
    mode = "auto",
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

require("dap.ext.vscode").load_launchjs()

local nmap = require("util.keymap").nmap
nmap("<F5>", "<cmd>lua require'dap'.continue()<CR>")
nmap("<F10>", "<cmd>lua require'dap'.step_over()<CR>")
nmap("<F11>", "<cmd>lua require'dap'.step_into()<CR>")
nmap("<F12>", "<cmd>lua require'dap'.step_out()<CR>")
nmap("<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
