-- ==============================================================================
-- settings
-- ==============================================================================
vim.opt.termguicolors = true
vim.cmd [[colorscheme gruvbox]]
-- #file
vim.opt.number = true
vim.opt.encoding = 'utf-8'                           -- vimでの文字エンコーディング
vim.opt.fileencodings = 'utf-8,sjis'                 -- バッファの改行コード指定
vim.opt.fileformats = 'unix,mac,dos'                 -- バッファの改行コード指定
-- #edit
vim.opt.showtabline=0
vim.cmd 'noswapfile'
vim.opt.clipboard = 'unnamedplus'                    -- clipboardとの連携
vim.opt.viminfo = ''                                 -- viminfoファイルを作成しない
vim.opt.undodir = vim.fn.stdpath('data')..'/undo'
vim.opt.undofile = true
vim.opt.cursorline = true                            -- カーソル位置(行)の非表示
vim.opt.virtualedit = 'block'                        -- visual-block時、行末を超えて選択可能にする
vim.opt.list = true                                  -- 不可視文字を表示
vim.opt.listchars = {
    tab = '>-',
    trail = '-',
    extends = '>',
    precedes = '<',
}
--opt.fixendofline = false
--opt.eol = false                                  -- ファイル末尾にeolを付けない
vim.opt.foldmethod = 'marker'
vim.opt.write = true
-- #tab
vim.opt.smarttab = true                             -- 行頭の余白内で<Tab>を入力すると、'shiftwidth'分をインデントする
vim.opt.autoindent = true                            -- 自動インデント
vim.opt.smartindent = true                           -- 自動インデント(ブロック対応)
vim.opt.tabstop = 2                                  -- ファイル内の<Tab>が対応する空白の数
vim.opt.softtabstop = 2                              -- 編集で<Tab>の幅として使用する空白の数
vim.opt.expandtab = true                             -- 挿入モードで<Tab>入力時、代わりに使う空白の数
vim.opt.shiftwidth = 2                               -- 自動インデントでのインデントの長さ
-- #search
vim.opt.showmatch = true                             -- 対応する括弧をハイライトする
vim.opt.hlsearch = true                              -- 検索結果をハイライト
vim.opt.ignorecase = true                            -- 大文字/小文字の区別しない
vim.opt.smartcase = true                             -- 大文字で検索されたら大文字/小文字を区別する
-- #json
vim.opt.conceallevel = 0                             -- ダブルクォーテーションを表示


-- ==============================================================================
-- common {{{
-- ==============================================================================
local symbols = {
    error = { icon = ' ', fg = "#fb4934" },
    warn = { icon = ' ', fg = "#fe8019" },
    info = { icon = ' ', fg = "#83a598" },
    hint = { icon = ' ', fg = "#fabd2f" }
}
-- }}}

-- ==============================================================================
-- plugins {{{
-- ==============================================================================
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]]

require('packer').startup(
    function(use)
        use { 'wbthomason/packer.nvim' }

        -- LSP
        use {
          'neovim/nvim-lspconfig',
          'williamboman/nvim-lsp-installer',
        }

        -- fuzzy finder
        --use {
        --  'junegunn/fzf',
        --  run = ":call fzf#install()",
        --  requires = {'junegunn/fzf.vim', opt = true}
        --}
        use { 'nvim-telescope/telescope.nvim',
            requires = {
                { 'nvim-lua/plenary.nvim' },
                { 'nvim-telescope/telescope-github.nvim' },
                { 'delphinus/telescope-memo.nvim' },
            }
        }

        -- colorscheme
        use { 'morhetz/gruvbox' }

        -- statusline
        use { 'hoob3rt/lualine.nvim',
            requires = {
                {'kyazdani42/nvim-web-devicons'}
            },
        }

        -- file explorer
        use {
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            setup = function()
              vim.g.nvim_tree_highlight_opened_files = 1
            end,
            config = function() require'nvim-tree'.setup {
                disable_netrw       = true,
                hijack_netrw        = true,
                open_on_setup       = false,
                ignore_ft_on_setup  = {},
                auto_close          = false,
                open_on_tab         = false,
                hijack_cursor       = false,
                update_cwd          = false,
                update_to_buf_dir   = {
                  enable = true,
                  auto_open = true,
                },
                diagnostics = {
                    enable = true
                }
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

        -- completion
        use { 'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/vim-vsnip',
                'hrsh7th/cmp-nvim-lsp',
                'onsails/lspkind-nvim'
            }
        }

        use {
            "folke/trouble.nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function()
                require("trouble").setup {
                    position = "right",
                    icon = true,
                    indent_lines = true,
                    fold_open = "",
                    fold_closed = "",
                    mode = "lsp_workspace_diagnostics",
                    use_lsp_diagnostic_signs = true,
                    action_keys = {
                        close = "q",
                        preview = "<C-p>",
                        cancel = "<esc>",
                    },
                    signs = {
                        error = "error",
                        warning = "warn",
                        information = "info",
                        hint = "hint"
                    }
                }
            end
        }

        -- dap
        use {
            "rcarriga/nvim-dap-ui",
            requires = {
                "mfussenegger/nvim-dap",
                "leoluz/nvim-dap-go"
            },
            config = function ()
                vim.fn.sign_define('DapBreakpoint', {text='⛔', texthl='', linehl='', numhl=''})
                vim.fn.sign_define('DapStopped', {text='👉', texthl='', linehl='', numhl=''})
                require('dapui').setup({
                    floating = {
                        max_height = 0.9,
                        max_width = 0.9
                    }
                })
                require('dap-go').setup()
                require('dap.ext.vscode').load_launchjs()
            end
        }

        use { 'mattn/vim-goimports', ft = {'go'} }
        use { 'mattn/vim-gomod', ft = {'gomod'}}
        use { 'kyoh86/vim-go-coverage', ft = {'go'}}
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
        use { 'mattn/vim-sonictemplate',
            setup = function()
                vim.g.sonictemplate_vim_template_dir = vim.fn.stdpath('config')..'/template'
            end
        }
        use { 'iberianpig/tig-explorer.vim' }
        use { 'easymotion/vim-easymotion' }
        use { 'nicwest/vim-camelsnek' }
        use { 'mattn/emmet-vim' }
        use { 'thinca/vim-quickrun' }
        use { 'vim-test/vim-test',
            config = function ()
                -- vim.g['test#neovim#start_normal'] = 1
                vim.g['test#strategy'] = 'neovim'
                vim.g['test#neovim#term_position'] = 'vert botright'
                vim.g['test#go#gotest#executable'] =  'gotest'
                vim.g['test#go#runner'] =  'gotest'
                vim.g['test#go#gotest#options'] =  '-v'
            end
        }
        use { 'thinca/vim-showtime', ft = {'markdown'} }
        use { 'mechatroner/rainbow_csv', ft = {'csv', 'tsv'} }
        use { 'stephpy/vim-yaml', ft = {'yaml'} }
        use { 'cespare/vim-toml', ft = {'toml'} }
        use { 'b4b4r07/vim-ltsv', ft = {'ltsv'} }
        use { 'hashivim/vim-terraform', ft = {'terraform'} }
        use { 'wakatime/vim-wakatime' }
        use { 'fladson/vim-kitty', ft = {'kitty'} }
        use { 'simeji/winresizer' }
        use { 'norcalli/nvim-colorizer.lua',
            config = function() require('colorizer').setup {'*'}  end
        }
    end
)
-- }}}

-- ==============================================================================
-- tree-sitter {{{
-- ==============================================================================
require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "bash",
      "cmake", "comment",
      "dockerfile", "dot",
      "http", "html",
      "go", "gomod",
      "json", "jsonc",
      "lua",
      "php", "python",
      "regex",
      "tsx", "typescript", "toml",
      "vim",
      "yaml",
    },
    sync_install = true,
    highlight = {
        enable = true
    },
    refactor = {
      highlight_definitions = { enable = true },
    },
    -- experimental
    indent = {
        enable = true
    }
}
-- }}}

-- ==============================================================================
-- dap {{{
-- ==============================================================================
local dap = require("dap")
dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
end

 dap.configurations.go = {
    {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
    {
        type = "go",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    -- works with go.mod packages and sub packages 
    {
        type = "go",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}
-- }}}

-- ==============================================================================
-- telescope {{{
-- ==============================================================================
local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<c-p>"] = actions_layout.toggle_preview,
                ["<esc>"] = actions.close
            },
        },
        file_ignore_patterns = {'.git/*', 'node_modules/*', '.terraform/*'},
        color_devicons = true,
        sorting_strategy = 'ascending',
        layout_strategy = 'flex',
        preview = {
            timeout = 1000,
            hide_on_startup = true
        }
    }
}

require('telescope').load_extension('gh')
require('telescope').load_extension('memo')
-- }}}

-- ==============================================================================
-- LSP {{{
-- ==============================================================================
--vim.lsp.set_log_level("debug")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>cl', '<cmd>lua vim.lsp.codelens.get()<CR>', opts)
  buf_set_keymap('n', '<leader>df', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>im', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>sm', '<cmd>lua vim.lsp.buf.document_symbol_search()<CR>', opts)
  buf_set_keymap('n', '<leader>Sm', '<cmd>lua vim.lsp.buf.workspace_symbol_search()<CR>', opts)
  buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ho', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>p',  '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>n',  '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- lsp-installer
local lsp_installer_dir = os.getenv("XDG_DATA_HOME").."/nvim-lsp-installer"
require("nvim-lsp-installer").settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    },
    install_root_dir = lsp_installer_dir,
    max_concurrent_installers = 4,
})

local servers = {
    "rust_analyzer",
    "gopls",
    "intelephense",
    "sumneko_lua",
    "terraformls",
    "tsserver",
}
local server_available, requested_server = require'nvim-lsp-installer.servers'.get_server(servers)
if server_available then
    requested_server:on_ready(function ()
      local opts = {}
        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        requested_server:install()
    end
end

require('lspconfig').gopls.setup {
    cmd = { lsp_installer_dir .. '/go/gopls', 'serve'},
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unreachable = true,
                unusedparams = true,
                fullstruct = true,
                nilness = true,
                unusedwrite = true
            },
            completeUnimported = true,
            hoverKind = 'SynopsisDocumentation',
            staticcheck = true,
            directoryFilters = {'-debug'},
            matcher = 'fuzzy',
            usePlaceholders = true,
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

require('lspconfig').intelephense.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        intelephense = {
            stubs = {
              "bcmath", "bz2", "calendar", "Core", "curl", "date",
              "dba", "dom", "enchant", "fileinfo", "filter", "ftp",
              "gd", "gettext", "hash", "iconv", "imap", "intl",
              "json", "ldap", "libxml", "mbstring", "mcrypt", "mysql",
              "mysqli", "password", "pcntl", "pcre", "PDO", "pdo_mysql",
              "Phar", "readline", "recode", "Reflection", "regex", "session",
              "SimpleXML", "soap", "sockets", "sodium", "SPL", "standard",
              "superglobals", "sysvsem", "sysvshm", "tokenizer", "xml", "xdebug",
              "xmlreader", "xmlwriter", "yaml", "zip", "zlib", "wordpress",
              "woocommerce", "acf-pro", "wordpress-globals", "wp-cli", "genesis", "polylang"
            },
            files = {
                maxSize = 5000000;
            }
        }
    }
}

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local sumneko_root_path = lsp_installer_dir .. '/sumneko_lua/extension/server/bin/'..system_name
require('lspconfig').sumneko_lua.setup {
    cmd = { sumneko_root_path..'/lua-language-server', "-E", sumneko_root_path.."/main.lua" };
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                checkThirdParty = false,
                preloadFileSize = 1000,
                maxPreload = 1600
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

require('lspconfig').terraformls.setup {
    cmd = { lsp_installer_dir..'/terraform/terraform-ls/terraform-ls', 'serve' },
    filetypes = { "terraform" },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

require('lspconfig').tsserver.setup {
    cmd = { lsp_installer_dir..'/tsserver/node_modules/.bin/typescript-language-server', '--stdio'},
    on_attach = on_attach,
    capabilities = capabilities
}
-- }}}

-- ==============================================================================
-- completion {{{
-- ==============================================================================
local cmp = require('cmp')
cmp.setup {
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                path = "[Path]",
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                vsnip = "[Vsnip]",
            })[entry.source.name]
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
            vim_item.abbr = string.sub(vim_item.abbr, 1, 50)
            return vim_item
        end
    },
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
    sources = {
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'vnip' }
    }
}
-- }}}

-- ==============================================================================
-- statusline {{{
-- ==============================================================================
require('lualine').setup{
    options = {
        theme = 'gruvbox',
        section_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
        icons_enabled = true,
    },
    sections = {
        lualine_a = { 'mode'},
        lualine_b = {
            { 'branch', icon = '' },
            { 'filename', file_status = true },
            { 'filetype', colored = true, icon_only = true }
        },
        lualine_c = {
            {
                'diff',
                colored = true,
                diff_color = {
                    added    = { 'DiffAdd' },
                    modified = { 'DiffChange' },
                    removed  = { 'DiffDelete' },
                },
                symbols = { added = '+', modified = '~', removed = '-' },
                source = nil,
            },
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = {
                    error = symbols.error.icon,
                    warn = symbols.warn.icon,
                    info = symbols.info.icon,
                    hint = symbols.hint.icon
                },
                colored = true,
                diagnostics_color = {
                  error = { fg = symbols.error.fg },
                  warn  = { fg = symbols.warn.fg },
                  info  = { fg = symbols.info.fg },
                  hint  = { fg = symbols.hint.fg },
                },
                update_in_insert = false,
                always_visible = true
            },
        },
        lualine_x = {},
        lualine_y = {
            {
                'fileformat',
                symbols = {
                    unix = '',
                    dos = '',
                    mac = '',
                },
            },
            'encoding',
        },
        lualine_z = {
            { 'progress' },
            { 'location' },
        },
    }
}
-- }}}

-- ==============================================================================
-- key-mappings {{{
-- ==============================================================================
vim.g.mapleader = ' '
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

map('n', ',f',  '<cmd>Telescope find_files<cr>', {silent=true})
map('n', ',rg', '<cmd>Telescope live_grep<cr>', {silent=true})
map('n', ',b',  '<cmd>Telescope buffers<cr>', {silent=true})

map("n", "<leader>xx",  "<cmd>TroubleToggle<cr>", {silent = true})
map("n", "<leader>xw",  "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", {silent = true})

map("n", ",n", "<cmd>NvimTreeToggle<CR>", {silent = true})
map("n", ",N", "<cmd>NvimTreeFindFile<CR>", {silent = true})

map('n', '<leader>T', '<cmd>TigOpenProjectRootDir<cr>')
map('n', '<leader>Tc', '<cmd>TigOpenCurrentFile<cr>')
map('n', '<leader>Tb', '<cmd>TigBlame<cr>')

map('n', '<leader>tn', '<cmd>TestNearest<CR>', { silent = true})
map('n', '<leader>tf', '<cmd>TestFile<CR>', { silent = true})
map('n', '<leader>ts', '<cmd>TestSuite<CR>', { silent = true})
map('n', '<leader>tl', '<cmd>TestLast<CR>', { silent = true})
map('n', '<leader>tv', '<cmd>TestVisit<CR>', { silent = true})

map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true})
map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true})
map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true})
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true})
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true})
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true})
map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true})
map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { silent = true})
map("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { silent = true})
-- }}}
