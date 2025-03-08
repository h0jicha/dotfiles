" Leaderキーをスペースに設定
let mapleader = " "

" 行番号・相対行番号を有効化
set number
set relativenumber

" インデント設定
set expandtab
set shiftwidth=4
set tabstop=4
set smartindent

" 検索設定
set ignorecase
set smartcase
set incsearch
set hlsearch
set wrapscan

" クリップボードをOSと共有
set clipboard=unnamedplus

" カーソルライン強調
set cursorline

" スクロール時の余白
set scrolloff=8
set sidescrolloff=8

" コマンドラインの表示設定
set cmdheight=1
set laststatus=2

" Neovimを高速化
set updatetime=300
set timeoutlen=500

" スワップファイルとバックアップを無効化
set noswapfile
set nobackup
set undofile  " アンドゥ履歴を保持



call plug#begin('~/.vim/plugged')

" UI向上
Plug 'nvim-lualine/lualine.nvim'   " ステータスライン
Plug 'akinsho/bufferline.nvim'     " バッファのタブ表示
Plug 'preservim/nerdtree'          " ファイルツリー
Plug 'nvim-telescope/telescope.nvim' " ファジーファインダー

" LSP & 補完
Plug 'neovim/nvim-lspconfig'  " LSPクライアント
Plug 'williamboman/mason.nvim' " LSP管理
Plug 'williamboman/mason-lspconfig'
Plug 'hrsh7th/nvim-cmp'        " 補完エンジン
Plug 'hrsh7th/cmp-nvim-lsp'    " LSP補完
Plug 'L3MON4D3/LuaSnip'        " スニペット


" Git 連携
Plug 'tpope/vim-fugitive'      " Git コマンドを Vim で使う
Plug 'lewis6991/gitsigns.nvim' " Git の差分表示

" カラースキーム
Plug 'folke/tokyonight.nvim'

call plug#end()


colorscheme tokyonight

" ウィンドウ操作
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ファイルツリー
nnoremap <leader>e :NERDTreeToggle<CR>

" バッファ操作
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Telescope
nnoremap <leader>ff :Telescope find_files<CR>
nnoremap <leader>fg :Telescope live_grep<CR>
nnoremap <leader>fb :Telescope buffers<CR>


lua << EOF
require("lualine").setup {
    options = {
        theme = "tokyonight",
        section_separators = { "", "" },  -- パワーライン風のセパレーター
        component_separators = { "", "" }, -- 仕切りを追加
        icons_enabled = true,
    },
    sections = {
        lualine_a = { { "mode", upper = true } }, -- モード表示
        lualine_b = { "branch", "diff", "diagnostics" }, -- Gitブランチと差分
        lualine_c = {
            { "filename", path = 1 },  -- フルパス表示
        },
        lualine_x = { "encoding", "fileformat", "filetype" }, -- エンコーディング情報
        lualine_y = { "progress" }, -- 進捗バー
        lualine_z = { "location" } -- カーソル位置
    },
    extensions = { "nerdtree", "quickfix", "fugitive" } -- NERDTreeやGit統合
}
EOF
