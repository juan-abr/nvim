" Ignore Files
set wildignore+=*.pyc
set wildignore+=*_build/*

call plug#begin('~/.vim/plugged')

" lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'L3MON4D3/LuaSnip'

" language servers
Plug 'omnisharp/omnisharp-vim', {'do': ':OmniSharpInstall'}

" telescope
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

lua require("juan-abr")

let mapleader = " "
