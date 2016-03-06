" vim-airline 'jardo' theme

" Normal mode
let s:N1 = [1, 1, 'black', 13]
let s:N2 = [1, 1, 13, 'black']
let s:N3 = [1, 1, 13, 'black']

" Insert mode
let s:I1 = [1, 1, 'black', 6]
let s:I2 = [1, 1, 6, 'black']
let s:I3 = [1, 1, 6, 'black']

" Visual mode
let s:V1 = [1, 1, 'black', 5]
let s:V2 = [1, 1, 5, 'black']
let s:V3 = [1, 1, 5, 'black']

" Replace mode
let s:R1 = [1, 1, 'black', 1]
let s:R2 = [1, 1, 1, 'black']
let s:R3 = [1, 1, 1, 'black']

" Paste mode
let s:PA = [1, 6]

" Info modified
let s:IM = [1, 238]

" Inactive mode
let s:IA1 = [1, 1, 10, 'black', '']
let s:IA2 = [1, 1, 10, 'black', '']
let s:IA3 = [1, 1, 10, 'black', '']

let g:airline#themes#jardo#palette = {}

let g:airline#themes#jardo#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#jardo#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#jardo#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#jardo#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#jardo#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)