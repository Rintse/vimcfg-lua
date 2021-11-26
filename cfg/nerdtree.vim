" NERDTRee configuration

" Savely gets the selected filename from NERDTree
" Used in airline: nerdtree statusbar shows this
function! GetNERDTreeFileName()
    let name = ""
    if  exists('g:NERDTreeFileNode') &&
    \ has_key(g:NERDTreeFileNode.GetSelected(), 'path')
        let name = g:NERDTreeFileNode.GetSelected().
        \path.getLastPathComponent(0)
    endif
    return name
endfunction

" Sets the current working directory to selection, 
" and updates NERDTree to adopt this new cwd
function! SetCWD()
    if  exists('g:NERDTreeFileNode') &&
    \ has_key(g:NERDTreeFileNode.GetSelected(), 'path')
        let selected = g:NERDTreeFileNode.GetSelected().path
        if !selected.isDirectory
            echo "Not a directory"
        else
            execute "cd" selected.str()
            NERDTreeCWD
        endif
    else
        call SetCWDToFile()
    endif
endfunction

" Sets the tree cwd to the parent of the curent file
function! SetCWDToFile()
    let dir = expand("#" . winbufnr(winnr()) . ":h")
    execute "cd" dir
    NERDTreeCWD
endfunction

" ======= START Configuration =========

" Shows the file/folder name in statusbar
let NERDTreeStatusline="%{GetNERDTreeFileName()}"

" Custom collapse/expand symbols
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" ======== END Configuration ==========


" ======== START Binds ================

nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>rt :NERDTreeRefreshRoot<CR>
nnoremap <silent> <Leader>cd :call SetCWD()<CR>
nnoremap <silent> <Leader>cf :call SetCWDToFile()<CR>

" ======== END Binds ==================
