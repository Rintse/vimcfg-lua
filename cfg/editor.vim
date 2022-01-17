" Vim editor changes

" Write-and-closes current buffer, and switches to the previous
function! CloseBuffer(save)
    let cur_buf = (winbufnr(winnr()))
    if(stridx(bufname(cur_buf), "NERD_tree") != -1)
        return " Dont do anything if in tree
    endif
    if a:save && bufname(cur_buf) == ""
        echo "File has no name: can't save and quit"
        return
    endif
    
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let buffers = map(buffers, 'bufname(v:val)')
    let windows = map(range(1, winnr('$')), 'bufname(winbufnr(v:val))')
    let windows = filter(windows, {idx, n -> stridx(n, "NERD_tree") == -1})
    " Available buffers to switch to (not already open) 
    let avail = filter(buffers, {idx, n -> index(windows, n) == -1})
    " Perform writes based on argument
    let write = ":w \|"
    let force = ""
    if !a:save
        let write = ":"
        let force = "!"
    endif
    if(len(avail) > 0)
        execute write "b " . avail[-1]  ." \| bd" . force . cur_buf
    else
        execute write "bd" . force
    endif
endfunction

" Moves the current window to the left
function! MoveWinLeft()
    execute "normal" winnr()-1 "\<C-w>x" "\<C-w>h"
endfunction


" ======== BEGIN General ==============

syntax on
colorscheme nord

set laststatus=2 "Always keep statusbar
set cmdheight=2 "More space for coc messages
set updatetime=300 "Shorten updatetime for more coc responsiveness

" Better tab completion for filenames
set wildmode=longest,list
set wildmenu

" Relative linenumbers except current line 
set number
set relativenumber

" Hidden buffers for easy switching
set hidden

" Set tab=4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Keep line history
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Keep undo history
set undofile
set undodir=~/.config/nvim/undodir

" Prevent swp files from accidentally getting gitted
:set directory=~/.config/nvim/swapfiles/

" No bell plz
set belloff=all

" Don't highlight searches by default
set nohls

" Whitespace after comment
let g:NERDSpaceDelims = 1

" Toggle spellingcheck for text documents
set spelllang=en_gb 
nnoremap <Leader>sc :set spell!<CR>
set spellsuggest+=10
set nojoinspaces

" Enable markdown highilghtng for md files
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

" ======== END General ================


" ======== BEGIN keybinds =============

nnoremap <Space> <Nop>
let mapleader = " "
let localleader = "\\"

" Disable ZZ to close (accidental capslock)
nnoremap Z <Nop>
nnoremap ZZ <Nop>

" Easy black hole reg
nnoremap - "_

" Swap colon and semicolon
noremap ; :
noremap : ;

" Place cursor in between brackets
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>

" I hate f1
nmap <F1> <Nop>
imap <F1> <Nop>

" Folding
set foldmethod=syntax

" Line objects
xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o^
onoremap al :normal val<CR>

" Comment selection
map <Leader>/t <plug>NERDCommenterToggle
map <Leader>/b <plug>NERDCommenterSexy

" (un)indent selection
vmap <Tab> >gv
vmap <S-Tab> <gv
" Regular indentation with tab 
nnoremap <Tab> >
nnoremap <S-Tab> <

" Delete into the black hole register
nnoremap <Del> "_x

" Saves and closes current buffer
nnoremap <silent> <Leader>wq :call CloseBuffer(1)<CR>
nnoremap <silent> <Leader>q! :call CloseBuffer(0)<CR>

" search for the current word/selection, while keeping cursor
nnoremap <Leader>d *N
vnoremap <Leader>d *N

" Convenient buffer stuff
nnoremap <Leader>sb :sb#<CR>
nnoremap <Leader>vsb :vertical sb#<CR>

" Window management
nnoremap <silent> <Leader>m<Left> :call MoveWinLeft()<CR>
nnoremap <silent> <Leader>m<Right> <C-w>x <C-w>l
nnoremap <Leader>- <C-w><<CR>
nnoremap <Leader>= <C-w>><CR>

" Toggle search highlighting 
:nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Search for selected text
vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gVzv:call setreg('"', old_reg, old_regtype)<CR>N

" ======== END keybinds ===============
