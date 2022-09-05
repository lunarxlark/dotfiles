local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua"
local install_packer_cmd = { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system(install_packer_cmd)
  vim.cmd([[packadd packer.nvim]])
end

local called, packer = pcall(require, "packer")
if not called then
  vim.notify("'packer' not found", "warn")
  return
end

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("PackerCompile", {}),
  pattern = { vim.fn.stdpath("config") .. "/lua/plugin.lua" },
  command = "source <afile> | PackerCompile",
})

packer.init({
  compile_path = compile_path,
  display = {
    open_fn = require("packer.util").float,
  },
})

packer.startup(function(use)
  local load = require("util.packer").load

  -- speed up loading
  use({ "lewis6991/impatient.nvim" })

  -- plugin manager
  use({ "wbthomason/packer.nvim" })

  -- common
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = load("nvim-treesitter") })
  use({ "antoinemadec/FixCursorHold.nvim" })
  use({ "SmiteshP/nvim-navic" })
  use({ "akinsho/toggleterm.nvim", config = load("toggleterm") })

  -- completion
  use({ "L3MON4D3/LuaSnip" })
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
    },
    config = load("nvim-cmp"),
  })
  use({ "saadparwaiz1/cmp_luasnip" })

  -- lsp
  use({ "williamboman/mason.nvim", config = load("mason") })
  use({ "williamboman/mason-lspconfig.nvim", config = load("mason-lspconfig") })
  use({ "neovim/nvim-lspconfig", config = load("nvim-lspconfig") })
  use({ "simrat39/inlay-hints.nvim", config = load("inlay-hints") })

  -- fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-ghq.nvim",
      "delphinus/telescope-memo.nvim",
      "~/dev/src/github.com/lunarxlark/telescope-aws.nvim",
    },
    config = load("telescope"),
  })

  -- formatter, diagnostics
  use({ "jose-elias-alvarez/null-ls.nvim", config = load("null-ls") })

  -- dap
  use({ "mfussenegger/nvim-dap", config = load("nvim-dap") })
  use({ "rcarriga/nvim-dap-ui", config = load("nvim-dap-ui") })
  use({ "leoluz/nvim-dap-go", ft = { "go" } })

  -- test
  use({ "nvim-neotest/neotest", config = load("neotest") })
  use({ "nvim-neotest/neotest-go" })
  use({ "nvim-neotest/neotest-plenary" })
  use({ "haydenmeade/neotest-jest" })

  -- visual
  use({ "goolord/alpha-nvim", config = load("alpha") }) -- startify
  use({ "rcarriga/nvim-notify", config = load("nvim-notify") })
  use({ "lukas-reineke/indent-blankline.nvim", config = load("indent-blankline") }) -- indent
  use({ "lewis6991/gitsigns.nvim", config = load("gitsigns") }) -- git symbol
  use({ "stevearc/dressing.nvim", config = load("dressing") })

  -- run task
  use({ "is0n/jaq-nvim", config = load("jaq"), cmd = "Jaq" })

  -- motion
  use({ "phaazon/hop.nvim", config = load("hop") })
  use({ "rainbowhxch/accelerated-jk.nvim", config = load("accelerated-jk") })

  -- comment
  use({ "numToStr/Comment.nvim", config = load("Comment") })
  use({ "B4mbus/todo-comments.nvim", config = load("todo-comments") })

  -- window resize
  use({ "simeji/winresizer", cmd = "WinResizerStartResize" })

  -- camel<->snek
  use({ "nicwest/vim-camelsnek" })

  -- statusline
  use({ "hoob3rt/lualine.nvim", config = load("lualine") })

  -- git
  use({
    "iberianpig/tig-explorer.vim",
    requires = { "rbgrouleff/bclose.vim" },
    config = load("tig-explorer"),
  })

  -- file type
  use({ "nanotee/sqls.nvim", ft = { "sql" } })
  use({ "kyoh86/vim-go-coverage", ft = { "go" } })
  use({ "mechatroner/rainbow_csv", ft = { "csv", "tsv" } })
  use({ "moznion/vim-ltsv", ft = { "ltsv" } })

  -- colorscheme
  use({ "ellisonleao/gruvbox.nvim", config = load("gruvbox") })

  -- test
  use({ "~/dev/src/github.com/lunarxlark/test.nvim" })
end)
