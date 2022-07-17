" Make switch to NORMAL mode more responsive
set ttimeoutlen=5

" Tabbing
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4

" Enable line numbers with room to spare
set number
set numberwidth=6

" Hard wrap at 80 columns
set textwidth=78

" Enable line highlighting
set cursorline

" Enable changing lines when moving beyond the beginning/end of the current line
set whichwrap+=<,>,h,l,[,]

" Always use syntax highlighting
syntax on

" Set minimal custom colorscheme
colorscheme shubh

" Display unprintable characters
set list
set listchars=tab:\ \ ,trail:•,extends:»,precedes:«

" Requires terminal to be viewed with Powerline font. Can be found in ~/.fonts
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0

" Configuration for vim-gitgutter
set updatetime=100
set signcolumn=yes
highlight SignColumn ctermbg=none

hi DiffAdd      ctermfg=green
hi DiffDelete   ctermfg=red
hi DiffChange   ctermfg=blue
