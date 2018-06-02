" pathogen plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on

"===============================================================================
" Theme
"===============================================================================

set background=dark
set termguicolors
colorscheme material-monokai
let g:materialmonokai_italic=1
let g:materialmonokai_subtle_spell=1
let g:airline_theme='materialmonokai'
highlight Comment cterm=italic

"===============================================================================
" General Settings
"===============================================================================

" Solid line for vsplit separator
set fcs=vert:│
" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
set number

" Always splits to the right and below
set splitright
set splitbelow

" Set to auto read when a file is changed from the outside
set autoread

" listchar=trail is not as flexible, use the below to highlight trailing
" whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Minimal number of screen lines to keep above and below the cursor
set scrolloff=10

" How many lines to scroll at a time, make scrolling appears faster
set scrolljump=5

" Min width of the number column to the left
set numberwidth=1

" Set backspace config
set backspace=eol,start,indent

" Case insensitive search
set ignorecase
set smartcase

" Column width indicator
set colorcolumn=+1

" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab

" Text display settings
set linebreak
set textwidth=120
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]

" Disable viminfo
set viminfo='10,<0,s0,h,/100,:100,@0

"===============================================================================
" Command-line Mode Key Mappings
"===============================================================================

" w!!: Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

