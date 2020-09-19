execute pathogen#infect()

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
set colorcolumn=80 "ruler

"Themes
colorscheme solarized

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

"Style
au BufWrite * :Autoformat
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

"Statusline
set laststatus=2
let g:lightline={ 'colorscheme':'solarized' }
set noshowmode

"TeX Live Preview
autocmd Filetype tex setl updatetime=1000
let g:livepreview_previewer='open -a Skim'
autocmd BufNewFile,BufRead *.tex nmap <C-t> :LLPStartPreview<CR>

"Markdown Preview
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-t>'
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_browser='Google Chrome'
