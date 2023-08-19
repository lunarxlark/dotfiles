vim.opt.termguicolors = true
-- vim.opt.mouse = "a"
-- vim.opt.cmdheight = 0

-- #file
vim.opt.number = true
vim.opt.encoding = "utf-8" -- vimでの文字エンコーディング
vim.opt.fileencodings = "utf-8,sjis" -- バッファの文字エンコード
vim.opt.fileformats = "unix,mac,dos" -- バッファの改行コード指定

-- #edit
vim.opt.showtabline = 0
vim.cmd([[noswapfile]])
vim.opt.clipboard = "unnamedplus" -- clipboardとの連携
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"
vim.opt.cursorline = true
vim.opt.virtualedit = "block" -- visual-block時、行末を超えて選択可能にする
vim.opt.foldmethod = "marker"
vim.opt.write = true
vim.cmd([[set nowrap]])

-- #tab
vim.opt.smarttab = true -- 行頭の余白内で<Tab>を入力すると、`shiftwidth`文をインデント
vim.opt.autoindent = true --自動インデント
vim.opt.smartindent = true -- 自動インデント(ブロック対応)
vim.opt.tabstop = 4 -- ファイル内の<Tab>が対応する空白の数
vim.opt.softtabstop = 4 -- 編集で<Tab>の幅として使用する空白の数
vim.opt.expandtab = true -- 挿入モードで<Tab>入力時、代わりに使う空白の数
vim.opt.shiftwidth = 4 -- 自動インデントでのインデントの長さ

-- #search
vim.opt.showmatch = true -- 対応する括弧をハイライトする
vim.opt.hlsearch = true -- 検索結果をハイライト
vim.opt.ignorecase = true -- 大文字/小文字を区別しない
vim.opt.smartcase = true -- 大文字で検索されたら大文字/小文字を区別する

-- #json
vim.opt.conceallevel = 0 -- ダブルクォーテーションを表示
