let s:scheme_slug = substitute("solarized-dark-custom", "-", "_", "g")

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
let s:cterm00        = "015" "
let s:cterm03        = "015" "
let s:cterm05        = "010" "SOMETHING INACTIVE
let s:cterm07        = "015" "FILE NAME [FILE MODIFIED]
let s:cterm08        = "015" "
let s:cterm0A        = "226" "NORMAL BG
let s:cterm0B        = "051" "INSERT BG
let s:cterm0C        = "015" "
let s:cterm0D        = "015" "
let s:cterm0E        = "001" "REPLACE BG
let s:cterm01        = "008" "PADDING BG
let s:cterm02        = "023" "FILE NAME / PROGRAM BG
let s:cterm04        = "015" "OTHER TEXT FG
let s:cterm06        = "015" "
let s:cterm09        = "208" "VISUAL BG
let s:cterm0F        = "015" "

let g:airline#themes#{s:scheme_slug}#palette.normal = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui04, s:cterm01, s:cterm0A ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#{s:scheme_slug}#palette.normal_modified = {
	\ 'airline_c' : [ s:gui07, s:gui01, s:cterm07, s:cterm01 ]}

let g:airline#themes#{s:scheme_slug}#palette.insert = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui0B, s:cterm01, s:cterm0B ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#{s:scheme_slug}#palette.insert_modified = {
	\ 'airline_c' : [ s:gui07, s:gui01, s:cterm07, s:cterm01 ]}

let g:airline#themes#{s:scheme_slug}#palette.replace = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui0E, s:cterm01, s:cterm0E ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#{s:scheme_slug}#palette.replace_modified = {
	\ 'airline_c' : [ s:gui07, s:gui01, s:cterm07, s:cterm01 ]}

let g:airline#themes#{s:scheme_slug}#palette.visual = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui09, s:cterm01, s:cterm09 ],
	\ [ s:gui04, s:gui02, s:cterm04, s:cterm02 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ])
let g:airline#themes#{s:scheme_slug}#palette.visual_modified = {
	\ 'airline_c' : [ s:gui07, s:gui01, s:cterm07, s:cterm01 ]}

let g:airline#themes#{s:scheme_slug}#palette.inactive = airline#themes#generate_color_map(
	\ [ s:gui01, s:gui01, s:cterm01, s:cterm01 ],
	\ [ s:gui04, s:gui01, s:cterm04, s:cterm01 ],
	\ [ s:gui05, s:gui01, s:cterm05, s:cterm01 ])
