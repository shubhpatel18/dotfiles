let s:scheme_slug = substitute("solarized-dark", "-", "_", "g")

let g:airline#themes#{s:scheme_slug}#palette = {}

" I have NOT customized these
" GUI color definitions
let s:gui00 = '#002b36'
let s:gui01 = '#073642'
let s:gui02 = '#586e75'
let s:gui03 = '#657b83'
let s:gui04 = '#839496'
let s:gui05 = '#93a1a1'
let s:gui06 = '#eee8d5'
let s:gui07 = '#fdf6e3'
let s:gui08 = '#dc322f'
let s:gui09 = '#cb4b16'
let s:gui0A = '#b58900'
let s:gui0B = '#859900'
let s:gui0C = '#2aa198'
let s:gui0D = '#268bd2'
let s:gui0E = '#6c71c4'
let s:gui0F = '#d33682'

" I have customized these
" Terminal color definitions
let s:ctermNB = "251" "NORMAL BG
let s:ctermIB = "051" "INSERT BG
let s:ctermVB = "208" "VISUAL BG
let s:ctermCB = "040" "COMMAND BG
let s:ctermRB = "001" "REPLACE BG
let s:ctermBG = "008" "PADDING BG
let s:cterm2B = "023" "GIT BRANCH | ENCODING BG
let s:ctermFG = "015" "TEXT FG

let g:airline#themes#{s:scheme_slug}#palette.normal = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui04, s:ctermBG, s:ctermNB ],
	\ [ s:gui04, s:gui02, s:ctermFG, s:cterm2B ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ])

let g:airline#themes#{s:scheme_slug}#palette.insert = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui0B, s:ctermBG, s:ctermIB ],
	\ [ s:gui04, s:gui02, s:ctermFG, s:cterm2B ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ])

let g:airline#themes#{s:scheme_slug}#palette.visual = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui09, s:ctermBG, s:ctermVB ],
	\ [ s:gui04, s:gui02, s:ctermFG, s:cterm2B ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ])

let g:airline#themes#{s:scheme_slug}#palette.commandline = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui04, s:ctermBG, s:ctermCB ],
	\ [ s:gui04, s:gui02, s:ctermFG, s:cterm2B ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ])

let g:airline#themes#{s:scheme_slug}#palette.replace = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui0E, s:ctermBG, s:ctermRB ],
	\ [ s:gui04, s:gui02, s:ctermFG, s:cterm2B ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ])

let g:airline#themes#{s:scheme_slug}#palette.inactive = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui01, s:ctermBG, s:ctermBG ],
	\ [ s:gui04, s:gui01, s:ctermFG, s:ctermBG ],
	\ [ s:gui05, s:gui01, s:ctermFG, s:ctermBG ])
