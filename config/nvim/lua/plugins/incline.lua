return {
  "b0o/incline.nvim",
  config = function()
    local function get_diagnostic_label(props)
      local icons = { error = "", warn = "", info = "", hint = "" }
      local label = {}
      for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
          table.insert(label, { icon .. " " .. n .. " ", group = "DiagnosticSign" .. severity })
        end
      end
      if #label > 0 then
        table.insert(label, { "| " })
      end
      return label
    end
    local function get_git_diff(props)
      local icons = { added = "", changed = "", removed = "" }
      local labels = {}
      local signs = vim.api.nvim_buf_get_var(props.buf, "gitsigns_status_dict")
      for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, { icon .. " " .. signs[name] .. " ", group = "Diff" .. name })
        end
      end
      if #labels > 0 then
        table.insert(labels, { "| " })
      end
      return labels
    end

    require("incline").setup({
      render = function(props)
        local buffer = {
          { get_diagnostic_label(props) },
          { get_git_diff(props) },
        }
        return buffer
      end,
    })
  end,
}
