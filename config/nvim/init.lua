vim.opt.mouse = "nvi"
vim.opt.termguicolors = true
-- #file
vim.opt.number = true
vim.opt.encoding = "utf-8" -- vimでの文字エンコーディング
vim.opt.fileencodings = "utf-8,sjis" -- バッファの改行コード指定
vim.opt.fileformats = "unix,mac,dos" -- バッファの改行コード指定
-- #edit
vim.opt.showtabline = 0
vim.cmd([[noswapfile]])
vim.opt.clipboard = "unnamedplus" -- clipboardとの連携
--vim.opt.viminfo = "" -- viminfoファイルを作成しない
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.cursorline = true -- カーソル位置(行)の非表示
vim.opt.virtualedit = "block" -- visual-block時、行末を超えて選択可能にする
vim.opt.list = true -- 不可視文字を表示
vim.opt.listchars = {
  tab = ">-",
  trail = "-",
  extends = ">",
  precedes = "<",
}
--opt.fixendofline = false
--opt.eol = false -- ファイル末尾にeolを付けない
vim.opt.foldmethod = "marker"
vim.opt.write = true
-- #tab
vim.opt.smarttab = true -- 行頭の余白内で<Tab>を入力すると、'shiftwidth'分をインデントする
vim.opt.autoindent = true -- 自動インデント
vim.opt.smartindent = true -- 自動インデント(ブロック対応)
vim.opt.tabstop = 2 -- ファイル内の<Tab>が対応する空白の数
vim.opt.softtabstop = 2 -- 編集で<Tab>の幅として使用する空白の数
vim.opt.expandtab = true -- 挿入モードで<Tab>入力時、代わりに使う空白の数
vim.opt.shiftwidth = 2 -- 自動インデントでのインデントの長さ
-- #search
vim.opt.showmatch = true -- 対応する括弧をハイライトする
vim.opt.hlsearch = true -- 検索結果をハイライト
vim.opt.ignorecase = true -- 大文字/小文字の区別しない
vim.opt.smartcase = true -- 大文字で検索されたら大文字/小文字を区別する
-- #json
vim.opt.conceallevel = 0 -- ダブルクォーテーションを表示

require("plugins")

vim.g.mapleader = " "
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>n", "<cmd>cnext<cr>", { silent = true })
map("n", "<leader>p", "<cmd>cprevious<cr>", { silent = true })

map("n", "<esc><esc>", "<cmd>set hls!<cr>", { silent = true })

map("n", "<leader>v", "<cmd>Telescope find_files cwd=$XDG_CONFIG_HOME/nvim<CR>", { silent = true })
map("n", "<leader>d", "<cmd>Telescope find_files cwd=$GHQ_ROOT/github.com/lunarxlark/dotfiles<CR>", { silent = true })
map("n", ",f", "<cmd>Telescope find_files<cr>", { silent = true })
map("n", ",rg", "<cmd>Telescope live_grep<cr>", { silent = true })
map("n", ",b", "<cmd>Telescope buffers<cr>", { silent = true })
map("n", "<leader>sm", "<cmd>Telescope lsp_document_symbols<cr>", { silent = true })

map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
map("n", "<leader>xr", "<cmd>TroubleRefresh<cr>", { silent = true })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })

map("n", ",n", "<cmd>NvimTreeToggle<CR>", { silent = true })
map("n", ",N", "<cmd>NvimTreeFindFile<CR>", { silent = true })

map("n", "<leader>T", "<cmd>TigOpenProjectRootDir<cr>")
map("n", "<leader>Tc", "<cmd>TigOpenCurrentFile<cr>")
map("n", "<leader>Tb", "<cmd>TigBlame<cr>")

map("n", "<leader>tn", "<cmd>lua require'neotest'.run.run()<CR>", { silent = true })
map("n", "<leader>tf", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<CR>", { silent = true })
map("n", "<leader>tS", "<cmd>lua require'neotest'.summary.toggle()<CR>", { silent = true })
map("n", "<leader>to", "<cmd>lua require'neotest'.output.open({enter=true})<CR>", { silent = true })

map("n", "<leader>D", "<cmd>lua require'dapui'.toggle()<CR>", { silent = true })
map("n", "<leader><leader>df", "<cmd>lua require'dapui'.eval()<CR>", { silent = true })
map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { silent = true })
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { silent = true })
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { silent = true })
map("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { silent = true })
map("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
map("n", "<leader>td", "<cmd>lua require'dap-go'.debug_test()<CR>", { silent = true })

map("n", "<leader>jq", "<cmd>Jaq<CR>", { silent = true })

map("n", "<leader><leader>b",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR })<CR>",
  { silent = true })
map("n", "<leader><leader>a",
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR })<CR>", { silent = true })
