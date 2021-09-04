" vim: set foldmethod=marker foldlevel=0 nomodeline:
" =============================================================================
"            __
"           |  \
" __     __  \$$ ______ ____    ______    _______
"|  \   /  \|  \|      \    \  /      \  /       \
" \$$\ /  $$| $$| $$$$$$\$$$$\|  $$$$$$\|  $$$$$$$
"  \$$\  $$ | $$| $$ | $$ | $$| $$   \$$| $$
"   \$$ $$  | $$| $$ | $$ | $$| $$      | $$_____
"    \$$$   | $$| $$ | $$ | $$| $$       \$$     \
"     \$     \$$ \$$  \$$  \$$ \$$        \$$$$$$$
" ==============================================================================
let mapleader = "\<Space>"

" ==============================================================================
" vim-plug {{{
" ==============================================================================
let g:plug_window = '-tabnew'
call plug#begin('~/.vim/plugged')

" Help
"Plug 'vim-jp/vimdoc-ja'

" Colorscheme
"Plug 'altercation/vim-colors-solarized'
"Plug 'jacoborus/tender.vim'
"Plug 'tomasr/molokai'
"Plug 'arcticicestudio/nord-vim'
"Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'

" Git / Gist
"Plug 'mattn/gist-vim'
"Plug 'mattn/webapi-vim'
"Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'

" Edit
Plug 'junegunn/fzf', {'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/vim-sonictemplate'
Plug 'direnv/direnv.vim'
Plug 'mattn/vim-goimports'
Plug 'easymotion/vim-easymotion'
Plug 'thinca/vim-quickrun'
Plug 'nicwest/vim-camelsnek'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install --save-dev --save-exact prettier',
  \ 'for': ['javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'html'] }
"Plug 'APZelos/blamer.nvim'
"Plug 'tyru/open-browser.vim'
"Plug 'vim-test/vim-test'
"Plug 'tpope/vim-surround'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'junegunn/vim-easy-align'
"Plug 'majutsushi/tagbar'
"Plug 'thinca/vim-showtime'
Plug 'osyo-manga/vim-precious'
Plug 'Shougo/context_filetype.vim'
"Plug 'rhysd/vim-clang-format'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'prabirshrestha/async.vim'
"Plug 'thomasfaingnaert/vim-lsp-snippets'
"Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" Completion
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

" Language / Filetype
"Plug 'lighttiger2505/sqls.vim'
"Plug 'jparise/vim-graphql'
Plug 'mattn/vim-gomod'
Plug 'stephpy/vim-yaml',          { 'for': 'yaml'}
Plug 'cespare/vim-toml',          { 'for': 'toml'}
Plug 'b4b4r07/vim-ltsv',          { 'for': 'ltsv'}
Plug 'mechatroner/rainbow_csv'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

" Terraform
Plug 'hashivim/vim-terraform'
"Plug 'juliosueiras/vim-terraform-completion'

call plug#end()
" }}}

" ==============================================================================
" vim-plugin extension {{{
" ==============================================================================
" ------------------------------------------------------------------------------
" vimdoc-ja
" ------------------------------------------------------------------------------
"set helplang=en,ja

" ------------------------------------------------------------------------------
" vim-prettier
" ------------------------------------------------------------------------------
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_files = ['.prettierrc']

autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.vue,*.css,*.scss,*.json PrettierAsync

" ------------------------------------------------------------------------------
" emmet-vim
" ------------------------------------------------------------------------------
autocmd FileType html,css,javascript,typescript EmmetInstall
" ------------------------------------------------------------------------------
" splash
" ------------------------------------------------------------------------------
"let g:splash#path = $HOME . '/.vim/vim_intro.txt'

" ------------------------------------------------------------------------------
" lightline.vim
" ------------------------------------------------------------------------------
if !has('gui_running')
  set t_Co=256
endif
set laststatus=2
set noshowmode

let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    [ 'readonly', 'filename', 'modified'],
  \  ],
  \  'right': [
  \    ['filetype', 'lineinfo', 'fileencoding', 'fileformat']
  \  ]
  \}
\}


" ------------------------------------------------------------------------------
" vim-lsp-settings
" ------------------------------------------------------------------------------
"  use XDG_DATA_HOME/vim-lsp-settings/setting.json


"" ------------------------------------------------------------------------------
"" context_filetype
"" ------------------------------------------------------------------------------
if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.go = [
  \ {
  \   'filetype': 'sql',
  \   'start' : 'sql\s:=\s`',
  \   'end' : '\s*\`'
  \ }
  \]

"let g:context_filetype#filetypes.terraform = [
"  \ {
"  \   'filetype': 'json',
"  \   'start' : '<<EOF$',
"  \   'end' : '^EOF$'
"  \ }
"  \]


" ------------------------------------------------------------------------------
" vim-sonictemplate
" ------------------------------------------------------------------------------
let g:sonictemplate_vim_template_dir = [
      \ '~/.vim/template'
  \]

" ------------------------------------------------------------------------------
" quickrun
" ------------------------------------------------------------------------------
let g:quickrun_config = {
      \ 'go': {
      \   'command': 'go',
      \   'runner': 'terminal',
      \  },
      \ 'go/test': {
      \   'command' : 'go',
      \   'exec': ['%C test -v'],
      \   'runner': 'terminal',
      \   'runner/terminal/into': 1,
      \   'runner/terminal/opener': 'below new',
      \   'type': 'go',
      \   },
      \ 'go/test/all': {
      \   'command' : 'go',
      \   'exec': ['%C test -v ./...'],
      \   'runner': 'terminal',
      \   'runner/terminal/into': 1,
      \   'runner/terminal/opener': 'below new',
      \   'type': 'go',
      \   },
      \ 'go/bench': {
      \   'command': 'go',
      \   'tempfile': '%{printf("%s_test.go", tempname())}',
      \   'exec': ['%C test -bench . -benchmem'],
      \   'runner': 'terminal',
      \   'runner/terminal/into': 1,
      \   'runner/terminal/opener': 'below new',
      \   'type': 'go',
      \   },
      \}

nmap <silent> <leader>qt :QuickRun go/test<CR>
nmap <silent> <leader>qta :QuickRun go/test/all<CR>
nmap <silent> <leader>qb :QuickRun go/bench<CR>

" ------------------------------------------------------------------------------
" vim-test
" ------------------------------------------------------------------------------
"let test#strategy = "vimterminal"
"
"nmap <silent> <leader>t :TestNearest<CR>
"nmap <silent> <leader>tf :TestFile<CR>
"nmap <silent> <leader>ts :TestSuite<CR>
"nmap <silent> <leader>tl :TestLast<CR>
"nmap <silent> <leader>tv :TestVisit<CR>


" ------------------------------------------------------------------------------
" vim-easy-alignment
" ------------------------------------------------------------------------------
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" ------------------------------------------------------------------------------
" vim-indent-guides
" ------------------------------------------------------------------------------
nmap <leader>ig  <Plug>IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup = 1 " vim起動時にindent-guide起動
let g:indent_guides_guide_size = 2            " indent-guideの単位
let g:indent_guides_color_change_percent = 5
let g:indent_guides_auto_colors = 0


" ------------------------------------------------------------------------------
" fzf
" ------------------------------------------------------------------------------
let g:fzf_layout = { 'down': '~40%'}
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded'}}
let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment']
      \}

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -nargs=0 Ghq call fzf#run({
  \ 'source' : 'ghq list --full-path',
  \ 'sink' : 'cd'
  \})

command! -nargs=0 Mru call fzf#run({
  \ 'source' : v:oldfiles,
  \ 'sink' : 'edit',
  \ 'options' : '-m -x +s',
  \ 'down' : '40%'
  \})

command! -bang -nargs=? Memo
  \ call fzf#vim#files(expand($HOME . '/.config/memo/_posts'), fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* SonicTemplate
      \ call fzf#sonictemplate#run()

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap ,F  :Files<CR>
nmap ,f  :GFiles<CR>
nmap ,s  :Snippet<CR>
nmap ,b  :Buffers<CR>
nmap ,g  :Ghq<CR>
nmap ,m  :Mru<CR>
nmap ,mm :Memo<CR>
nmap ,rg :Rg<CR>
nmap ,t  :SonicTemplate<CR>

" ------------------------------------------------------------------------------
" govim
" ------------------------------------------------------------------------------
"nmap <silent> <buffer> <Leader>h : <C-u>call GOVIMHover()<CR>
"nnoremap <buffer> <silent> <Leader>gd :hide GOVIMGoToDef<cr>

" ------------------------------------------------------------------------------
" vim-lsp
" ------------------------------------------------------------------------------
" debug
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('./vim-lsp.log')

let g:lsp_async_completion = 1
let g:lsp_text_edit_enabled = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_float_delay = 0
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_document_code_action_signs_delay = 0

let g:lsp_document_highlight_enabled = 1
let g:lsp_highlight_references_enabled = 1


let g:lsp_signs_enabled = 1         " enable signs
"let g:lsp_signs_error = {'text': '✗'}
"let g:lsp_signs_warning = {'text': '‼'}

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <leader>ac <plug>(lsp-code-action)
    nmap <buffer> <leader>cl <plug>(lsp-code-lens)
    nmap <buffer> <leader>df <plug>(lsp-definition)
    nmap <buffer> <leader>dd <plug>(lsp-document-diagnostics)
    nmap <buffer> <leader>im <plug>(lsp-implementation)
    nmap <buffer> <leader>pdf <plug>(lsp-peek-definition)
    nmap <buffer> <leader>sm <plug>(lsp-document-symbol-search)
    nmap <buffer> <leader>Sm <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <leader>rf <plug>(lsp-references)
    nmap <buffer> <leader>td <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>en <plug>(lsp-next-error)
    nmap <buffer> <leader>ep <plug>(lsp-previous-error)
    nmap <buffer> <leader>ho <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 500
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"set foldmethod=expr
"  \ foldexpr=lsp#ui#vim#folding#foldexpr()
"  \ foldtext=lsp#ui#vim#folding#foldtext()
let g:lsp_fold_enabled = 0

" ------------------------------------------------------------------------------
" vim-terraform
" ------------------------------------------------------------------------------
let g:terraform_fmt_on_save = 1
" }}}

" ------------------------------------------------------------------------------
" vim-clang-format
" ------------------------------------------------------------------------------
let g:clang_format#cde_style = "goolge"
let g:clang_format#auto_format = 1

autocmd FileType c,proto ClangFormatAutoEnable

" ==============================================================================
" basic {{{
" ==============================================================================
syntax enable
"set background=light
set background=dark
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" file
set encoding=utf-8           " vimでの文字エンコーディング
set termencoding=utf-8       " terminalでの文字エンコーディング
set fileencodings=utf-8,sjis " バッファの改行コード指定
set fileformats=unix,mac,dos " バッファの改行コード指定

" edit
set number
set clipboard+=unnamed     " clipboardとの連携
set noswapfile             " swapファイルを作成しない
set nobackup               " backupを作成しない
set viminfo=               " viminfoファイルを作成しない
set undodir=~/.vimundo
augroup undo
  autocmd BufReadPre ~/* setlocal undofile
augroup END
set nocursorcolumn         " カーソル位置(列)の非表示
set cursorline           " カーソル位置(行)の非表示
set nrformats=             " 10進数認識に変更
set virtualedit=block      " visual-block時、行末を超えて選択可能にする
set list                   " 不可視文字を表示
set listchars=tab:>-,trail:-,extends:>,precedes:<
set binary noeol           " ファイル末尾にeolを付けない
set foldmethod=marker
set write
"set scrolloff=999

" tab
set smarttab               " 行頭の余白内で<Tab>を入力すると、'shiftwidth'分をインデントする
set autoindent             " 自動インデント
"set smartindent            " 自動インデント(ブロック対応)
set tabstop=2              " ファイル内の<Tab>が対応する空白の数
set softtabstop=2          " 編集で<Tab>の幅として使用する空白の数
set expandtab              " 挿入モードで<Tab>入力時、代わりに使う空白の数
set shiftwidth=2           " 自動インデントでのインデントの長さ

" search
set showmatch              " 対応する括弧をハイライトする
set hlsearch               " 検索結果をハイライト
set ignorecase             " 大文字/小文字の区別しない
set smartcase              " 大文字で検索されたら大文字/小文字を区別する

" json
set conceallevel=0         " ダブルクォーテーションを表示
"let g:vim_json_syntax_conceal = 0  " Yggrdroot/indentLineで2にしている設定を0に戻す
" }}}

" ==============================================================================
" key-mappings {{{
" ==============================================================================
inoremap <silent> jj <ESC>
nnoremap <leader>v :tabnew $MYVIMRC<CR>
nnoremap <leader>V :tabnew $MYGVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>S :source $MYGVIMRC<CR>

noremap <silent><Esc><ESC> :<C-u>set nohlsearch!<CR>

nnoremap <leader><Tab>N :tabnew<CR>
nnoremap <leader><Tab>n :tabn<CR>
nnoremap <leader><Tab>p :tabp<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>
" }}}

" ==============================================================================
" autocmd {{{
" ==============================================================================
augroup vimrc
  autocmd!
  " file types
  au BufNewFile,BufRead *.js,*.ts,*.tsx setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au BufNewFile,BufRead Dockerfile* set filetype=dockerfile
  au BufNewFile,BufRead *.tsv set filetype=tsv
  au BufNewFile,BufRead *.tf,*.tfvars,*.tfstate setlocal filetype=terraform
  au FileType sql setlocal noexpandtab ts=4 sw=4 smartindent
augroup END

" "TODOと同じハイライトに追加
"augroup Highlight
"  au!
"  autocmd BufWinEnter * match Todo /DEBUG/
"  autocmd BufWinEnter * match Todo /\<MEMO\>/
"  autocmd BufWinEnter * match Todo /\<WIP\>/
"  autocmd BufWinEnter * match Todo /\<DEV\>/
"augroup END
" }}}