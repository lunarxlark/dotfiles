return {
  "norcalli/nvim-colorizer.lua",

  event = "BufReadPost",
  config = function()
    require("colorizer").setup({
      "css",
      "tsx",
      "javascript",
      "lua",
      "toml",
      "noice",
    })
  end,
}
