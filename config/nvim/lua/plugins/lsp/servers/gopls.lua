return {
  settings = {
    gopls = {
      analyses = {
        fieldalignment = false,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      completeUnimported = true,
      hoverKind = "SynopsisDocumentation",
      -- hoverKind = "SingleLine",
      staticcheck = false, -- replace to golangci-lint by null-ls
      directoryFilters = { "-debug" },
      usePlaceholders = true,
      codelenses = {
        gc_details = true,
        generate = true,
        test = true,
        tidy = true,
        vendor = false,
        upgrade_dependency = true,
      },
    },
  },
}
