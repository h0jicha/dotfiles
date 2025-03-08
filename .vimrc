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

" Vimを高速化
set updatetime=300
set timeoutlen=500

" スワップファイルとバックアップを無効化
set noswapfile
set nobackup
set undofile  " アンドゥ履歴を保持


" ========== プラグイン設定 ==========
call plug#begin('~/.vim/plugged')

" UI向上
Plug 'nvim-lualine/lualine.nvim'   " ステータスライン
Plug 'preservim/nerdtree'          " ファイルツリー
Plug 'junegunn/fzf'                " ファジーファインダー
Plug 'junegunn/fzf.vim'            " fzf の拡張

" Git 連携
Plug 'tpope/vim-fugitive'      " Git コマンドを Vim で使う
Plug 'airblade/vim-gitgutter'  " Git の差分表示

" カラースキーム
Plug 'ghifarit53/tokyonight-vim'

" ステータスライン
Plug 'itchyny/lightline.vim'  

call plug#end()

" カラースキームの適用
colorscheme tokyonight

" ========== キーマッピング ==========
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

" fzf (ファイル検索・テキスト検索)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>

" ステータスライン設定 (Neovimと互換性あり)
let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ }
      \ }
