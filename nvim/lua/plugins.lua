-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'
  use 'tpope/vim-endwise'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-sensible'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'sheerun/vim-polyglot'
  use({ 'toppair/peek.nvim', run = 'deno task --quiet build:fast' })
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use { 'Everblush/everblush.nvim', as = 'everblush' }

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }


  -- Lazy loading:
  -- Load on specific commands
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- Load on an autocommand event
  use {'andymass/vim-matchup', event = 'VimEnter'}

  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  use {
    'w0rp/ale',
    ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
    cmd = 'ALEEnable',
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Plugins can have dependencies on other plugins
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  }
  -- Post-install/update hook with neovim command
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = function()
      local vim = vim
      local opt = vim.opt

      opt.foldmethod = "expr"
      opt.foldexpr = "nvim_treesitter#foldexpr()"
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'Mofiqul/dracula.nvim'
  use "rebelot/kanagawa.nvim"
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'mhinz/vim-startify' }
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  })
  -- use 'itchyny/lightline.vim'
  use 'nvim-tree/nvim-web-devicons'

  use ({
    'ray-x/go.nvim',
    config = function()
    end
  })
  use 'ray-x/guihua.lua'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use "williamboman/mason.nvim"
  use ({
    'neovim/nvim-lspconfig',
    config = function()
      require'lspconfig'.gopls.setup{}
    end
  })
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {"williamboman/mason-lspconfig.nvim"}
  use {"glepnir/lspsaga.nvim"}
  use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use "github/copilot.vim"
  use "NLKNguyen/papercolor-theme"
  use {
	'crusj/structrue-go.nvim',
	branch = "main",
    config = function()
      require"structrue-go".setup()
    end
  }
  use {"akinsho/toggleterm.nvim", tag = '*'}
  use "rafamadriz/friendly-snippets"
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
  })
  use {
    'stevearc/oil.nvim',
    config = function() require('oil').setup() end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  }
  use {'sotte/presenting.vim'}
  use {'mfussenegger/nvim-lint'}
end)
