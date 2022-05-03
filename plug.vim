if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'

if has("nvim")
  "Copilot
  Plug 'github/copilot.vim'
  "Windows
  Plug 'pprovost/vim-ps1'
  "
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'

  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'

  Plug 'rafamadriz/friendly-snippets'

  Plug 'octaltree/cmp-look'
  Plug 'hrsh7th/cmp-calc'
  Plug 'f3fora/cmp-spell'
  Plug 'hrsh7th/cmp-emoji'
  Plug 'quangnguyen30192/cmp-nvim-tags'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'ray-x/cmp-treesitter'

  Plug 'tamago324/cmp-zsh'
  Plug 'Shougo/deol.nvim'

  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
  "Plug 'SirVer/ultisnips'
  "Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  "Plug 'honza/vim-snippets'

  "Plug 'saadparwaiz1/cmp_luasnip'
  "Plug 'L3MON4D3/LuaSnip'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePluginp' }
  Plug 'folke/lsp-colors.nvim'
  Plug 'windwp/nvim-autopairs'

  Plug 'mikelue/vim-maven-plugin'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()
