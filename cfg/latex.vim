" Configure okular interface
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--noraise --unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:tex_flavor = "latex"

" Start backwards search server
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif

" Don't show underfull hbox warnings
let g:vimtex_quickfix_ignore_filters = [
          \ 'Underfull \\hbox' ]

" Latex files should be hard limited at 80 chars
au FileType tex set tw=80 wm=2

" Completion is done by the language server
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
" Auto indentation is annoying
let g:vimtex_indent_enabled=0

