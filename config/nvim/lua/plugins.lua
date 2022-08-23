local present, packer = pcall(require, "packer")
if not present then
  return
end

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd([[packadd packer.nvim]])
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PackerCompile", {}),
  pattern = "*/nvim/**/*.lua",
  command = "source <afile> | PackerCompile",
})

packer.init({
  compile_path = compile_path,
  display = {
    open_fn = require("packer.util").float,
  },
})

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" }) -- plugin manager

  -- common
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", })

  use({ "morhetz/gruvbox" }) -- colorscheme
  use({ "hoob3rt/lualine.nvim" }) -- statusline
  use({ "goolord/alpha-nvim" }) -- startify
  use({ "lukas-reineke/indent-blankline.nvim" }) -- indent
  use({ "lewis6991/gitsigns.nvim" })
  use({ "iberianpig/tig-explorer.vim" }) -- git
  use({ "akinsho/toggleterm.nvim" }) -- terminal
  use({ "is0n/jaq-nvim" }) -- run task
  use({ "phaazon/hop.nvim" }) -- motion
  use({ "rainbowhxch/accelerated-jk.nvim" }) -- motion
  use({ "numToStr/Comment.nvim" }) -- comment
  use({ "folke/todo-comments.nvim" }) -- comment
  use({ "simeji/winresizer" }) -- resize
  use({ "nicwest/vim-camelsnek" }) -- camel<->snek

  -- lsp
  use({ "williamboman/nvim-lsp-installer" })
  use({ "neovim/nvim-lspconfig" })
  use({ "SmiteshP/nvim-navic" })
  use({ "simrat39/inlay-hints.nvim" })

  -- completion
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/vim-vsnip" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "onsails/lspkind-nvim" })

  -- dap
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })
  use({ "leoluz/nvim-dap-go" })

  -- test
  use({ "nvim-neotest/neotest" })
  use({ "antoinemadec/FixCursorHold.nvim" })
  use({ "nvim-neotest/neotest-go" })
  use({ "nvim-neotest/neotest-plenary" })

  -- file type
  use({ "nanotee/sqls.nvim", ft = { "sql" } })
  use({ "kyoh86/vim-go-coverage", ft = { "go" } })
  use({ "mechatroner/rainbow_csv", ft = { "csv", "tsv" } })
  use({ "stephpy/vim-yaml", ft = { "yaml" } })
  use({ "cespare/vim-toml", ft = { "toml" } })
  use({ "b4b4r07/vim-ltsv", ft = { "ltsv" } })
  use({ "hashivim/vim-terraform", ft = { "terraform" } })

  -- fuzzy finder
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope-github.nvim" })
  use({ "nvim-telescope/telescope-ghq.nvim" })
  use({ "delphinus/telescope-memo.nvim" })
  use({ "~/dev/src/github.com/lunarxlark/telescope-aws.nvim" })
end)
