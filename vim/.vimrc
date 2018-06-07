" pathogen plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on

"===============================================================================
" Theme
"===============================================================================

set background=dark

if system('uname -n') =~ "sdk-home"
  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
  "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
  "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif
else
  let g:onedark_termcolors=256
endif

let g:onedark_terminal_italics=1
let g:airline_theme='onedark'
colorscheme onedark
highlight Comment cterm=italic

"===============================================================================
" General Settings
"===============================================================================

" Solid line for vsplit separator
set fcs=vert:│
" Give one virtual space at end of line
set virtualedit=onemore

" Turn on line number
"set number

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
