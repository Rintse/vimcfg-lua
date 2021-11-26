" FZF (Fuzzy file finder) configuration 


" ======= START Configuration =========

let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.35 } }

" ======= END Configuration ===========


" ======= START Keybinds ==============

let g:fzf_action = { 'ctrl-s': 'vsplit' }

nnoremap <silent> <Leader>f :NERDTreeClose <bar> :Files<CR>
nnoremap <silent> <Leader>rf :NERDTreeClose <bar> :Rg<CR>
nnoremap <silent> <Leader>hf :NERDTreeClose <bar> :Files ~<CR> 
nnoremap <silent> <Leader>rhf :NERDTreeClose <bar> :Rg ~<CR> 

" ======= START Keybinds ==============
