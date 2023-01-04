return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('Mofiqul/dracula.nvim', {
    config = vim.cmd[[colorscheme dracula]],
    setup = vim.cmd[[let g:dracula_colorterm = 0]]
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')
  use('rcarriga/nvim-notify')
  use('mbbill/undotree')

end)
