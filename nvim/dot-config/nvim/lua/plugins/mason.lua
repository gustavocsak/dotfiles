return {
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'nvim-lspconfig',
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      -- List the servers you want Mason to ensure are installed
      ensure_installed = { "tsserver", "pyright", "jdtls" }, -- Add your desired servers
      automatic_installation = true,
    })

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Configure tsserver
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      settings = {
        typescript = {
          tsdk = {
            directory = "", -- Leave empty for global tsc
          },
        },
        javascript = {
          format = {
            enable = true,
            semicolons = 'insert',
            singleQuote = true,
          },
        },
      },
    }

    -- Configure pyright (example)
    lspconfig.pyright.setup {
      capabilities = capabilities,
      -- Add pyright specific settings if needed
    }

    -- Configure jdtls (example - remember to set your JDK path)
    lspconfig.jdtls.setup {
      capabilities = capabilities,
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "Java 23", -- Or your preferred Java version
                path = "/usr/bin/java", -- Replace with your JDK path
                default = true,
              }
            }
          }
        }
      }
    }

    -- Add configurations for other language servers you use here
  end,
}
