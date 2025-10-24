return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      -- Capabilities (for nvim-cmp support)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
      if cmp_ok then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      -- Key mappings when LSP attaches
      local on_attach = function(_, bufnr)
        local nmap = function(keys, func, desc)
          if desc then
            desc = 'LSP: ' .. desc
          end
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        nmap('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
        nmap('<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, '[F]ormat')

        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            vim.diagnostic.open_float(nil, { focus = false })
          end,
        })
      end

      -- Setup LSP servers
      -- clangd (C/C++)
      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- tsserver (TypeScript/JavaScript)
      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- pyright (Python)
      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- jdtls (Java)
      lspconfig.jdtls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "Java 23",
                  path = "/usr/bin/java", -- Change if needed
                  default = true,
                }
              }
            }
          }
        }
      }

      -- gopls (Go)
      lspconfig.gopls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            -- Optional: Add any gopls specific settings here.
            -- For example, to enable staticcheck:
            analyses = {
              staticcheck = true,
            },
          },
        },
      }
    end,
  },

  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    config = function()
      require('mason').setup()
    end,
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'clangd', 'ts_ls', 'pyright', 'jdtls', 'gopls' },
        automatic_installation = true,
      }
    end,
  },
}

