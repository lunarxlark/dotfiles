return function()
    require('gitsigns').setup{
        signcolumn = true,
        numhl      = true,
        linehl     = false,
        word_diff  = true,
    }
end
