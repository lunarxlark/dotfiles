return {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        preloadFileSize = 600,
        maxPreload = 3200,
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
      format = {
        enable = false,
        defaultConfig = {
          indent_style = "space",
          indent_size = "2",
          continuation_indent_size = "2",
        },
      },
    },
  },
}
