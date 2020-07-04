" vimrc stuff
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" enable syntax highlighting
syntax enable
set clipboard+=unnamedplus
" show line numbers
" set number
set number relativenumber
set conceallevel=2
" set tabs to have 4 spaces
set ts=4
" indent when moving to the next line while writing code
set autoindent
" expand tabs into spaces
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
" show a visual line under the cursor's current line
set cursorline
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
" split layouts
set splitbelow
set splitright
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set statusline^=%{coc#status()}
let g:ailine_theme='angr'
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
let g:neomake_python_enabled_makers = ['pylint']
autocmd BufEnter * EnableBlameLine
" Show blame info below the statusline instead of using virtual text
" let g:blameLineUseVirtualText = 0
hi HighlightedyankRegion cterm=reverse gui=reverse
set updatetime=100
" colorscheme pulumi
" colorscheme gruvbox
" autocmd vimenter * NERDTree
" coc-configuration https://github.com/neoclide/coc.nvim#example-vim-configuration
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
autocmd FileType apache setlocal commentstring=#\ %s
let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'virtual'
" FZF
nnoremap <C-p> :Files<Cr>
nnoremap <C-l> :Rg<Cr>
"NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'pgavlin/pulumi.vim'
Plug 'tveskag/nvim-blame-line'
Plug 'mileszs/ack.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tveskag/nvim-blame-line'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-fugitive'
Plug 'wsdjeg/FlyGrep.vim'
Plug 'Shougo/echodoc.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'dart-lang/dart-vim-plugin'
Plug 'morhetz/gruvbox'
call plug#end()

syntax on
set t_Co=256
set cursorline
colorscheme gruvbox
