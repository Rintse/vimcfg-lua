set nocompatible              " be iMproved, required
filetype plugin indent on

" ==== BEGIN Plug =====
call plug#begin()
" Highlight other occurences of word under cursor
Plug 'RRethy/vim-illuminate'
" Allow other processes to interact (like back-srch in pdf)
Plug 'mhinz/neovim-remote'
" Surround objects
Plug 'tpope/vim-surround'

" Looks
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdcommenter'

" File/buffer/window management
Plug 'jeetsukumaran/vim-buffergator'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sindrets/winshift.nvim'

" Autocomplete (cmp)
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

" LSP stuff
Plug 'rmagatti/goto-preview'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
" LSP Dependencies
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Pandoc/LaTeX
Plug 'lervag/vimtex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()
" ==== END Plug =====

" General editor configuration
source ~/.config/nvim/cfg/editor.vim

" NERDTree configuration 
source ~/.config/nvim/cfg/nerdtree.vim

" Airline configuration 
source ~/.config/nvim/cfg/airline.vim

" FZF configuration 
source ~/.config/nvim/cfg/fzf.vim

" Buffergator configuration
source ~/.config/nvim/cfg/buffergator.vim

" Latex plugins
source ~/.config/nvim/cfg/latex.vim

" LSP stuff in lua
:lua require('goto-preview').setup{ height = 25; }
:lua require('nvim-treesitter.configs').setup{highlight={enable = true};}
:lua require('lsp')
:lua require('autocomplete')
