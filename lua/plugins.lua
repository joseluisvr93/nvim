local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }
  use 'kyazdani42/nvim-web-devicons' -- File icons

  use({
    'glepnir/lspsaga.nvim',
    branch = "main",
    config = function()
      require("lspsaga").setup({})
    end,
  })
  use 'L3MON4D3/LuaSnip'     -- Snippet
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-vmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer'   -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-calc'
  use 'octaltree/cmp-look'

  use 'williamboman/nvim-lsp-installer'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  if is_win then
    use {
      'tzachar/cmp-tabnine', run = './install.ps1', requires = 'hrsh7th/nvim-cmp'
    }
  else
    use {
      'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp'
    }
  end

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim'       -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- LSP

  use 'jose-elias-alvarez/typescript.nvim'

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'rmagatti/alternate-toggler' -- alternate between True and False
  use 'gcmt/wildfire.vim'          -- visual between [] {} ()
  use 'tpope/vim-surround'         -- change surround
  use 'mg979/vim-visual-multi'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browser

  use "numToStr/Comment.nvim"
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'phaazon/hop.nvim',
    branch = 'v2'
  }

  use 'goolord/alpha-nvim'

  -- jupyter plugin
  use {
    "ahmedkhalf/jupyter-nvim",
    run = ":UpdateRemotePlugins",
    config = function()
      require("jupyter-nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- use 'Shougo/defx.nvim'
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)
