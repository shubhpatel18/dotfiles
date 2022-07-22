" Setup leader
let mapleader = "\<Space>"
map <leader>u :u<CR>
map <leader>h :noh<CR>
map <leader># 78<S-I>#<Esc>o<Esc>
map <leader>o o<Esc>
map <leader>O O<Esc>
set showcmd
set timeoutlen=500

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

" Configure cursor
set cursorline

" Enable changing lines when moving beyond the beginning/end of the current line
set whichwrap+=<,>,h,l,[,]

" Always use syntax highlighting
syntax on

" Enable highlight while searching
set hlsearch

" Set minimal custom colorscheme
colorscheme shubh

" Display unprintable characters
set list
set listchars=tab::\ ,trail:•,extends:»,precedes:«

" Requires terminal to be viewed with Powerline font. Can be found in ~/.fonts
let g:airline_powerline_fonts=1
let g:airline_theme='solarized_dark_custom'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0

let g:tmuxline_preset = {
	\	'win'  : '#I:#W',
	\	'cwin' : '#I:#W',
	\	'z'    : '#h',
	\	'options' : {
	\	'status-justify' : 'left',
	\	'pane-border-style' : 'fg=colour234',
	\	'pane-active-border-style' : 'fg=colour234 bg=colour238'
	\	},
	\ }
let g:tmuxline_theme = {
	\   'a'    : [ 017, 008 ],
	\   'b'    : [ 017, 008 ],
	\   'c'    : [ 017, 008 ],
	\   'win'  : [ 017, 027 ],
	\   'cwin' : [ 017, 036 ],
	\   'x'    : [ 017, 008 ],
	\   'y'    : [ 017, 027 ],
	\   'z'    : [ 017, 036 ],
	\   'bg'   : [ 017, 008 ],
	\ }

" Configuration for vim-gitgutter
set updatetime=100
set signcolumn=yes

hi DiffAdd      ctermfg=green
hi DiffDelete   ctermfg=red
hi DiffChange   ctermfg=blue
