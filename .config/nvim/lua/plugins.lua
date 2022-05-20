local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.init(
  {
    compile_path = compile_path,
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'rounded' }
      end,
    }
  }
)

packer.startup(function(use)
  -- plugin manager
  use { 'wbthomason/packer.nvim' }

  -- colorscheme
  use { 'morhetz/gruvbox',
    config = function()
      require("config.gruvbox")
    end
  }

  -- lsp
  use { 'williamboman/nvim-lsp-installer',
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('config.nvim-lsp')
      end
    }
  }

  use { 'folke/trouble.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config.trouble')
    end
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config.nvim-treesitter')
    end,
    run = ':TSUpdate'
  }

  -- fuzzy finder
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-github.nvim',
      'delphinus/telescope-memo.nvim',
    },
    config = function()
      require('config.telescope')
    end
  }

  -- statusline
  use { 'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config.lualine')
    end
  }

  -- completion
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp',
      'onsails/lspkind-nvim',
    },
    config = function()
      require('config.nvim-cmp')
    end
  }

  use {
    "tzachar/cmp-tabnine",
    requires = { 'hrsh7th/nvim-cmp' },
    run = "./install.sh",
  }

  use { 'mattn/vim-sonictemplate',
    setup = function()
      vim.g.sonictemplate_vim_template_dir = vim.fn.stdpath('config')..'/template'
    end
  }

  -- dap
  use { 'mfussenegger/nvim-dap',
    config = function()
      require('config.nvim-dap')
    end
  }

  use { 'rcarriga/nvim-dap-ui',
    config = function ()
      require('config.nvim-dap-ui')
    end,
    after = 'nvim-dap',
  }

  use { 'leoluz/nvim-dap-go' }

  -- debug consoleでのansi escape code対策
  use { 'chrisbra/Colorizer',
    setup = function ()
      vim.g.colorizer_auto_filetype = 'dap-repl'
      vim.g.colorizer_disable_bufleave = 1
    end
  }

  -- comment out
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- test
  use {
    "klen/nvim-test",
    config = function()
      require('config.nvim-test')
    end
  }

  -- file explorer
  use { 'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    setup = function()
      vim.g.nvim_tree_highlight_opened_files = 1
    end,
    config = function()
      require('config.nvim-tree')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('config.gitsigns')
    end
  }

  -- motion
  use { 'easymotion/vim-easymotion' }
  use { 'rainbowhxch/accelerated-jk.nvim',
    config = function()
      require('config.accelerated-jk')
    end
  }

  -- indent
  use { 'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent-blankline')
    end
  }

  use { 'simeji/winresizer' }
  use { 'iberianpig/tig-explorer.vim' }
  use { 'nicwest/vim-camelsnek' }
  use { 'mattn/emmet-vim' }
  -- use { 'thinca/vim-quickrun' }
  use { 'is0n/jaq-nvim',
    config = function ()
      require('config.jaq')
    end
  }

  -- file type
  use { 'mattn/vim-goimports', ft = {'go'} }
  use { 'mattn/vim-gomod', ft = {'gomod'}}
  use { 'kyoh86/vim-go-coverage', ft = {'go'}}
  use { 'thinca/vim-showtime', ft = {'markdown'} }
  use { 'mechatroner/rainbow_csv', ft = {'csv', 'tsv'} }
  use { 'stephpy/vim-yaml', ft = {'yaml'} }
  use { 'cespare/vim-toml', ft = {'toml'} }
  use { 'b4b4r07/vim-ltsv', ft = {'ltsv'} }
  use { 'hashivim/vim-terraform', ft = {'terraform'} }
  use { 'fladson/vim-kitty', ft = {'kitty'} }
end)
