local fn = vim.fn
local cmd = vim.cmd
local opt = vim.opt

-- ==============================================================================
-- plugins
-- ==============================================================================
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  cmd 'packadd packer.nvim'
end

cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]

require('packer').startup(function()
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- LSP
  use { 'neovim/nvim-lspconfig'}

  -- fuzzy finder
  use {
    'junegunn/fzf',
    run = ":call fzf#install()",
    requires = {'junegunn/fzf.vim', opt = true}
  }

  -- colorscheme
  --use { 'sainnhe/gruvbox-material' }
  use { 'morhetz/gruvbox' }

  -- statusline
  use { 'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox_material',
          section_separators = {'', ''},
          component_separators = {'', ''},
          icons_enabled = true,
        },
        sections = {
          lualine_a = { {'mode', upper = true} },
          lualine_b = { {'branch', icon = ''} },
          lualine_c = {
            {'filename', file_status = true},
            {
              'diagnostics',
              sources = { 'nvim_lsp' },
              sections = {'error', 'warn', 'info'},
              symbols = {error = ' ', warn = ' ', info = ' '},
              color_error = '#ec5f67',
              color_warn = '#ECBE7B',
              color_info = '#008080',
            },
          },
          lualine_x = { 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {  },
          lualine_b = {  },
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {  },
          lualine_z = {  }
        },
        extensions = { 'quickfix', 'fzf' }
      }
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup{
        signcolumn = true,
        numhl      = true,
        linehl     = false,
        word_diff  = true,
    }
    end
  }

  use { 'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/cmp-nvim-lsp'
    }
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        position = "bottom",
        height = 3,
        icon = true,
        mode = "lsp_workspace_diagnostics",
        indent_lines = true, -- add an indent guide below the fold icons
        fold_open = "", -- icon used for open folds
        fold_closed = "", -- icon used for closed folds
        action_keys = { -- key mappings for actions in the trouble list
          close = "q", -- close the list
          preview = "p", -- preview the diagnostic location
          cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        },
        signs = {
            error = "error",
            warning = "warn",
            hint = "hint",
            information = "info"
        },
        use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
      }
    end
  }

  use { 'mattn/vim-goimports', ft = {'go'} }
  use { 'mattn/vim-gomod', ft = {'gomod'}}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'mattn/vim-sonictemplate' }
  use { 'iberianpig/tig-explorer.vim' }
  use { 'easymotion/vim-easymotion' }
  use { 'nicwest/vim-camelsnek' }
  use { 'mattn/emmet-vim' }
  use { 'thinca/vim-quickrun' }
  use { 'vim-test/vim-test' }
  use { 'thinca/vim-showtime', ft = {'markdown'} }
  use { 'mechatroner/rainbow_csv', ft = {'csv', 'tsv'} }
  use { 'stephpy/vim-yaml', ft = {'yaml'} }
  use { 'cespare/vim-toml', ft = {'toml'} }
  use { 'b4b4r07/vim-ltsv', ft = {'ltsv'} }
  use { 'hashivim/vim-terraform', ft = {'terraform'} }
end)

vim.g.sonictemplate_vim_template_dir = fn.stdpath('config')..'/template'

require('nvim-treesitter').setup {
  highlight = {
    enable = true
  }
}

-- ==============================================================================
-- LSP
-- ==============================================================================
-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.get()<CR>', opts)
  buf_set_keymap('n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>im', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>sm', '<cmd>lua vim.lsp.buf.document_symbol_search()<CR>', opts)
  buf_set_keymap('n', '<leader>Sm', '<cmd>lua vim.lsp.buf.workspace_symbol_search()<CR>', opts)
  buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ho', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

require('lspconfig').gopls.setup {
  cmd = { vim.fn.exepath('gopls'), 'serve' },
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        fullstruct = true,
      },
      hoverKind = 'SynopsisDocumentation',
      staticcheck = true,
      directoryFilters = {'-debug'},
      usePlaceholders = true,
      matcher = 'fuzzy',
      codelenses = {
        gc_details = true,
        generate = true,
        test = true,
        tidy = true,
        vendor = false,
      },
    }
  }
}

--require('lspconfig').terraformls.setup {
--  cmd = { vim.fn.exepath('terraform-ls'), 'serve' },
--  filetypes = { "terraform" },
--  on_attach = on_attach,
--  capabilities = capabilities,
--  flags = {
--    debounce_text_changes = 150,
--  }
--}

-- ==============================================================================
-- completion
-- ==============================================================================
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  srouces = {
    { name = 'nvim_lsp' },
    { name = 'vnip' }
  }
}
vim.opt.completeopt = 'menuone,noinsert,noselect'


-- ==============================================================================
-- key-mappings
-- ==============================================================================
vim.g.mapleader = ' '
-- map helper
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>s', '<cmd>source $MYVIMRC<cr>', { silent = true})
map('n', '<leader>S', '<cmd>source $MYGVIMRC<cr>', { silent = true})
map('n', '<leader>v', '<cmd>tabnew $MYVIMRC<cr>', { silent = true })
map('n', '<leader>V', '<cmd>tabnew $MYGVIMRC<cr>', { silent = true})
map('n', '<leader><tab>N', '<cmd>tabnew<cr>', { silent = true})
map('n', '<leader><tab>n', '<cmd>tabn<cr>', { silent = true})
map('n', '<leader><tab>p', '<cmd>tabp<cr>', { silent = true})
map('n', '<leader>n', '<cmd>cnext<cr>', { silent = true})
map('n', '<leader>p', '<cmd>cprevious<cr>', { silent = true})

map('n', '<esc><esc>', '<cmd>set hls!<cr>', { silent = true } )
map('n', '<leader>T', '<cmd>TigOpenProjectRootDir<cr>')


-- ==============================================================================
-- test
-- ==============================================================================
-- vim.g['test#neovim#start_normal'] = 1
--vim.g['test#strategy'] = 'neovim'
vim.g['test#strategy'] = 'neovim'
vim.g['test#neovim#term_position'] = 'vert botright'
vim.g['test#go#gotest#executable'] =  'gotest'
vim.g['test#go#runner'] =  'gotest'
vim.g['test#go#gotest#options'] =  '-v'
map('n', '<leader>tn', '<cmd>TestNearest<CR>', { silent = true})
map('n', '<leader>tf', '<cmd>TestFile<CR>', { silent = true})
map('n', '<leader>ts', '<cmd>TestSuite<CR>', { silent = true})
map('n', '<leader>tl', '<cmd>TestLast<CR>', { silent = true})
map('n', '<leader>tv', '<cmd>TestVisit<CR>', { silent = true})


-- ==============================================================================
-- fzf
-- ==============================================================================
vim.env.FZF_DEFAULT_COMMAND = [[fd --type f --hidden --follow --exclude .git --exclude node_modules]]

vim.api.nvim_command[[
  command! -bang -nargs=? -complete=dir Files
  call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
]]

vim.api.nvim_command[[
  command! -nargs=0 Ghq
  call fzf#run({ 'source' : 'ghq list --full-path', 'sink' : 'cd'})
]]

vim.api.nvim_command[[
  command! -bang -nargs=* Rg
  call fzf#vim#grep( 'rg --column --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
]]

vim.api.nvim_command[[
  command! -bang -nargs=* SonicTemplate
  call fzf#sonictemplate#run()
]]

map('n', ',f',  '<cmd>Files<cr>', { silent = true})
map('n', ',b',  '<cmd>Buffers<cr>', { silent = true})
map('n', ',g',  '<cmd>Ghq<cr>', { silent = true})
map('n', ',rg', '<cmd>Rg<cr>', { silent = true})
map('n', ',st', '<cmd>SonicTemplate<cr>', { silent = true})


-- ==============================================================================
-- settings
-- ==============================================================================
vim.opt.termguicolors = true
vim.cmd [[colorscheme gruvbox]]
-- #file
opt.number = true
opt.encoding = 'utf-8'                           -- vimでの文字エンコーディング
opt.fileencodings = 'utf-8,sjis'                 -- バッファの改行コード指定
opt.fileformats = 'unix,mac,dos'                 -- バッファの改行コード指定
-- #edit
opt.showtabline=2
cmd 'noswapfile'
opt.clipboard = 'unnamedplus'                    -- clipboardとの連携
opt.viminfo = ''                                 -- viminfoファイルを作成しない
opt.undodir = fn.stdpath('data')..'/undo'
opt.undofile = true
opt.cursorline = true                            -- カーソル位置(行)の非表示
opt.virtualedit = 'block'                        -- visual-block時、行末を超えて選択可能にする
opt.list = true                                  -- 不可視文字を表示
opt.listchars = {
  tab = '>-',
  trail = '-',
  extends = '>',
  precedes = '<',
}
--opt.fixendofline = false
--opt.eol = false                                  -- ファイル末尾にeolを付けない
opt.foldmethod = 'marker'
opt.write = true
-- #tab
opt.smarttab = true                             -- 行頭の余白内で<Tab>を入力すると、'shiftwidth'分をインデントする
opt.autoindent = true                            -- 自動インデント
opt.smartindent = true                           -- 自動インデント(ブロック対応)
opt.tabstop = 2                                  -- ファイル内の<Tab>が対応する空白の数
opt.softtabstop = 2                              -- 編集で<Tab>の幅として使用する空白の数
opt.expandtab = true                             -- 挿入モードで<Tab>入力時、代わりに使う空白の数
opt.shiftwidth = 2                               -- 自動インデントでのインデントの長さ
-- #search
opt.showmatch = true                             -- 対応する括弧をハイライトする
opt.hlsearch = true                              -- 検索結果をハイライト
opt.ignorecase = true                            -- 大文字/小文字の区別しない
opt.smartcase = true                             -- 大文字で検索されたら大文字/小文字を区別する
-- #json
opt.conceallevel = 0                             -- ダブルクォーテーションを表示
