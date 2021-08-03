""""""""""""""""""""""""""""""""
" Scott Killen vim configuration
""""""""""""""""""""""""""""""""
set nocompatible
packadd! dracula_pro
syntax enable
set nowrap
set encoding=utf8
filetype plugin indent on

" Show line numbers
set number
set ruler

" Tab settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display status line
set laststatus=2

" Highlight current line
set cursorline

" Solid line for vsplit separator
set fcs=vert:│

" Give one virtual space at end of line
set virtualedit=onemore

" Always splits to the right and below
set splitright
set splitbelow

" Set to auto read when a file is changed from the outside
set autoread

" Highlight trailing whitespace
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

" Text display settings
set linebreak
set textwidth=120
set autoindent
set whichwrap+=h,l,<,>,[,]

" Disable viminfo
set viminfo='10,<0,s0,h,/100,:100,@0

" Mode dependent cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""
set t_co=256
set background=dark
let base16colorspace=256
let g:dracula_colorterm = 0

if (has("termguicolors"))
  set termguicolors
endif

colorscheme dracula_pro_van_helsing

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula_pro'

""""""""""""""""""""""""""""""""
" Command-line Mode Key Mappings
""""""""""""""""""""""""""""""""

" w!! - Writes using sudo
cnoremap w!! w !sudo tee % >/dev/null

""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
