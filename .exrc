let g:db="postgresql://postgres@localhost:5434/tpch_sf100"
let g:extra_whitespace_ignored_filetypes = ['md','sql']

set nowrap
set foldlevel=999

highlight clear ColorColumn

nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>

let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limelight_bop = '^\s*$\n\zs'
let g:limelight_eop = '^\s*$'

" autocmd BufRead *.md Limelight
" autocmd BufRead *pro-tip*,*title*,*thank*,.exrc,*.dbout,*.sql Limelight!
