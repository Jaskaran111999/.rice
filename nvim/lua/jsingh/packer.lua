return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} },
    setup = { defaults = { file_ignore_patterns = { "node_modules" } } },
    commit = "74ce793"
  }
 
  use({ "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })
 
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  }

  use 'norcalli/nvim-colorizer.lua'
 
  use { 'folke/which-key.nvim' }
 
--  use('Mofiqul/dracula.nvim', {
--    config = vim.cmd[[colorscheme dracula]],
--    setup = vim.cmd[[let g:dracula_colorterm = 0]]
--  })
 
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/nvim-treesitter-refactor'
 
  use('rcarriga/nvim-notify')
  use('mbbill/undotree')
  use 'nvim-tree/nvim-web-devicons'
  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<M-l>",
            next = "<M-k>",
            prev = "<M-j>",
            dismiss = "<M-h>",
          },
        },
      })
    end,
  }
 
  use {
  'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
 
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
 
      -- Snippets
      {'L3MON4D3/LuaSnip'},
      -- Snippet Collection (Optional)
      {'rafamadriz/friendly-snippets'},
    }
  }
 
  use { 'lewis6991/gitsigns.nvim' }
  use { 'wfxr/minimap.vim' }
  use { 'Yggdroot/indentLine' }
  use { 'itchyny/lightline.vim' }

  -- Colorscheme
  use { 'AlexvZyl/nordic.nvim' }

end)
