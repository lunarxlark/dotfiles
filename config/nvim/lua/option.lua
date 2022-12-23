vim.opt.termguicolors = true
--vim.opt.cmdheight = 0
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
--opt.fixendofline = false
--opt.eol = false -- ファイル末尾にeolを付けない
vim.opt.foldmethod = "marker"
vim.opt.write = true
vim.cmd([[set nowrap]])
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

vim.keymap.set("n", "<leader>cn", "<cmd>cnext<cr>", { silent = true })
vim.keymap.set("n", "<leader>cp", "<cmd>cprevious<cr>", { silent = true })
vim.keymap.set("n", "<esc><esc>", "<cmd>set hls!<cr>", { silent = true })
vim.keymap.set("n", "<C-[>", "<cmd>lne<cr>", { silent = true })
vim.keymap.set("n", "<C-]>", "<cmd>lpr<cr>", { silent = true })
