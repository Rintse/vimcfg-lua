set nocompatible              " be iMproved, required
filetype plugin indent on

" ==== BEGIN Plug =====
call plug#begin()

Plug 'mhinz/neovim-remote'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdcommenter'

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'preservim/nerdtree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'RRethy/vim-illuminate'

Plug 'lervag/vimtex'
Plug 'neovim/nvim-lspconfig'

Plug 'rmagatti/goto-preview'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Autocomplete (cmp)
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
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
:lua require('goto-preview').setup()
:lua require('lsp')
:lua require('autocomplete')
