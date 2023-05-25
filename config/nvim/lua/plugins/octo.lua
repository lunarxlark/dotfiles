return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require("octo").setup()
  end
}
