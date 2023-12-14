local lsp = require('lsp-zero').preset('recommended')

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tfsec'] = {'terraform'},
  }
})

lsp.setup()

-- Configure LSPs
local lspconfig = require('lspconfig')

-- tfsec
require('lspconfig.configs').tfsec = {
  default_config = {
    cmd = {'tfsec'},
    filetypes = {'terraform'},
  },
}

-- Python
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'E501'},
          maxLineLength = 100
        }
      }
    }
  }
}
