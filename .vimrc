" Plugins
call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/indentpython.vim'
Plug 'itchyny/lightline.vim'
call plug#end()

"Settings
set nocompatible
set confirm "asks to save when quitting
set wildmenu "visual autocomplete
set lazyredraw "redraw only when we need to
set visualbell "diable beeping
set mouse=a "select text with cursor
nmap <C-\> :NERDTreeToggle<CR>

"Syntax
syntax on
set background=dark
set ruler "shows line#,col# on bottom right side
set number "line numbers
set cursorline "highlight current line
set colorcolumn=120 "ruler

"Themes
colorscheme onedark
"colorscheme solarized

"Indentation
filetype indent plugin on
set shiftwidth=4 "number of spaces in tab when using << and >>
set softtabstop=4 "number of spaces in tab when editing
set tabstop=4 "number of visual spaces per tab
set expandtab "tabs are spaces
set autoindent "apply current indentation to next line when using o and O
set smartindent "indentation based on code

"Frontend Indentation
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 "JavaScript
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 tabstop=2 "HTML
autocmd FileType css setlocal shiftwidth=2 softtabstop=2 tabstop=2 "CSS
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 tabstop=2 "ruby

"Splitting
set splitright
set splitbelow

"Folding
set foldenable
set foldlevelstart=99
set foldnestmax=20
set foldmethod=indent

"Backspacing
set backspace=indent,eol,start "backspace settings

"Search
set hlsearch "highlight search matches
set incsearch "search incrementally
set ignorecase "case insensitive search
set smartcase "when search contains uppercase, it is case sensitive

"Statusline
set laststatus=2
let g:lightline={ 'colorscheme':'onedark' }
set noshowmode

