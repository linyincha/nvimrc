let mapleader = " "
set autochdir
set number
set relativenumber
set cursorline
let &t_ut=''
set showcmd
set wildmenu
set ignorecase
set smartcase
set mouse=a
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set indentexpr=
set list
set tw=0
set timeoutlen=1000 ttimeoutlen=0
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set lazyredraw
set visualbell
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
"set colorcolumn=100
set updatetime=100
set virtualedit=block
" === 当关闭文件再重新用vim打开时，光标回到上次退出的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ==================== Basic Mappings ====================
noremap ; :
nnoremap q :q<CR>
nnoremap S :w<CR>
noremap <LEADER><CR> :nohlsearch<CR>
noremap H 7h
noremap J 7j
nnoremap <C-j> 7j
noremap K 7k
nnoremap <C-k> 7k
noremap L 7l
noremap n nzz
noremap N Nzz
noremap U <C-r>
inoremap <C-k> <UP>
inoremap <C-j> <DOWN>
inoremap <C-h> <LEFT>
inoremap <C-l> <RIGHT>
inoremap <C-p> <ESC>jA
inoremap <C-o> <ESC>o
noremap <C-u> 0
" === 原本的C-i是回到光标原来的位置，配合C-o使用
noremap <C-p> <C-i>
noremap <C-i> $
inoremap <C-i> <ESC>A
inoremap <C-u> <ESC>I
noremap <LEADER><LEADER> /<++><CR>:nohlsearch<CR>c4l
" === 与系统共享剪贴板，快捷键双引号加号再复制会复制到剪贴板中
vnoremap Y "+y

"map tf :set nosplitright<CR>:vsplit<CR>
noremap ts :set splitright<CR>:vsplit<CR>
"map su :set nosplitbelow<CR>:split<CR>
noremap td :set splitbelow<CR>:split<CR>

noremap <LEADER>w <C-w>w
noremap <LEADER>h <C-w>h
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>l <C-w>l
noremap _ :vertical resize-5<CR>
noremap + :vertical resize+5<CR>

noremap tn :tabe<CR>
noremap tu :-tabnext<CR>
noremap ti :+tabnext<CR>

" ===================== Vim Plug =====================
call plug#begin('$HOME/.config/nvim/plugged')

" 屏幕下方彩色条
Plug 'vim-airline/vim-airline'
" 配色主题
Plug 'connorholyday/vim-snazzy'
" 屏幕右边滚动条
Plug 'petertriho/nvim-scrollbar'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 代码不全
Plug 'honza/vim-snippets'
" 快速查找文件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
" 浏览器实时预览markdown
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" 快速修改代码包裹
Plug 'tpope/vim-surround'
" 快速选择代码块
Plug 'gcmt/wildfire.vim'
" 多光标操作
Plug 'mg979/vim-visual-multi'
" 按下分号后，可视化显示寄存器
Plug 'junegunn/vim-peekaboo'
call plug#end()

" === Plug snazzy
let g:SnazzyTransparent = 1
color snazzy

" ==================== nvim-scrollbar ====================
lua <<EOF
require("scrollbar").setup()
EOF

" ==================== coc ==========================
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-vimlsp',
  \ 'coc-snippets',
  \ 'coc-yank',
  \ 'coc-explorer']

" 剪贴板历史
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-/> coc#refresh()

let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-m>'

" === explorer
noremap tt :CocCommand explorer<CR>

" === FZF
noremap <C-f> :FZF
noremap <LEADER>ag :Ag<CR>
noremap <LEADER>ah :History<CR>

let g:VM_maps = {}
let g:VM_maps["Select Cursor Down"] = '<C-=>'
let g:VM_maps["Select Cursor Up"]   = '<C-+>'
