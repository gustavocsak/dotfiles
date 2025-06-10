return {
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  -- { 'L3MON4D3/LuaSnip' },
  -- { 'saadparwaiz1/cmp_luasnip' },
  -- { 'echasnovski/mini.snippets' },
  -- { 'abeldekat/cmp-mini-snippets' },
  -- { 'SirVer/ultisnips' },
  -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
  -- { 'dcampos/nvim-snippy' },
  -- { 'dcampos/cmp-snippy' },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'nvim-cmp' }, -- Ensure nvim-cmp is loaded first
    config = function()
      -- LSP config (as before)
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Example for tsserver:
      -- lspconfig.tsserver.setup { capabilities = capabilities }
      -- Example for pyright:
      -- lspconfig.pyright.setup { capabilities = capabilities }
      -- Add setup for all your language servers here
    end,
  },
  {
    'hrsh7th/cmp-nvim-lsp',
    dependencies = { 'nvim-cmp', 'nvim-lspconfig' }, -- Ensure dependencies are loaded
  },
  {
    'hrsh7th/cmp-buffer',
    dependencies = { 'nvim-cmp' },
  },
  {
    'hrsh7th/cmp-path',
    dependencies = { 'nvim-cmp' },
  },
  {
    'hrsh7th/cmp-cmdline',
    dependencies = { 'nvim-cmp' },
  },
  {
    'hrsh7th/cmp-vsnip',
    dependencies = { 'nvim-cmp', 'vim-vsnip' },
  },
  {
    'hrsh7th/vim-vsnip',
  },
  -- Configure nvim-cmp itself
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
            -- For `mini.snippets` users:
            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            -- insert({ body = args.body }) -- Insert at cursor
            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            -- require("cmp.config").set_onetime({ sources = {} })
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          -- { name = 'luasnip' },
          -- { name = 'ultisnips' },
          -- { name = 'snippy' },
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })
    end,
    dependencies = {
      'nvim-lspconfig',
      'cmp-nvim-lsp',
      'cmp-buffer',
      'cmp-path',
      'cmp-cmdline',
      'cmp-vsnip',
      'vim-vsnip',
    },
  },
  -- Add configurations for other snippet engines if you uncomment them
  -- Example for LuaSnip:
  -- {
  --   'L3MON4D3/LuaSnip',
  --   config = function()
  --     require('luasnip.loaders.from_vscode').load()
  --   end,
  -- },
  -- {
  --   'saadparwaiz1/cmp_luasnip',
  --   dependencies = { 'nvim-cmp', 'LuaSnip' },
  -- },
  -- ... and so on for other snippet engines
}
