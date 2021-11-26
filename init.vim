set nocompatible              " be iMproved, required
filetype plugin indent on

" ==== BEGIN Vunlde =====
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/neovim-remote'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'arcticicestudio/nord-vim'
Plugin 'preservim/nerdcommenter'

Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'preservim/nerdtree'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'RRethy/vim-illuminate'

Plugin 'lervag/vimtex'
Plugin 'neovim/nvim-lspconfig'

" Autocomplete (cmp)
Plugin 'hrsh7th/cmp-vsnip'
Plugin 'hrsh7th/vim-vsnip'

Plugin 'hrsh7th/cmp-nvim-lsp'
Plugin 'hrsh7th/cmp-buffer'
Plugin 'hrsh7th/cmp-path'
Plugin 'hrsh7th/cmp-cmdline'
Plugin 'hrsh7th/nvim-cmp'

call vundle#end()
" ==== END Vunlde =====

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
:lua require('lsp')
:lua require('autocomplete')
