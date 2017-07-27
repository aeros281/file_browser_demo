set nocompatible
set termguicolors

call plug#begin('~/.local/share/nvim/plugged')

" Initialize plugin system
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'maralla/completor.vim'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern', {'do': 'npm install'}
Plug 'ternjs/tern_for_vim'
Plug 'roxma/ncm-flow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '│'

Plug 'albertorestifo/github.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/Colorizer'

Plug 'timeyyy/orchestra.nvim'
Plug 'timeyyy/clackclack.symphony'
Plug 'timeyyy/bubbletrouble.symphony'

Plug 'iCyMind/NeoSolarized'
Plug 'rakr/vim-one'

"Command plugins
" Plug 'justinmk/vim-sneak'
" let g:sneak#label = 1
Plug 'easymotion/vim-easymotion'

"Language plugin
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()


" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)


" Autoindent options
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent
set number


"set colorscheme
"set t_Co=256
colorscheme one
set background=light


"airline configuration
set laststatus=2
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='one'

" Gvim settings
if has('gui_running')
	set guifont=Inconsolata\ 13
endif

" Enable save as root hack
cmap w!! w !sudo tee > /dev/null %

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

call orchestra#prelude()
"call orchestra#set_tune('clackclack')
