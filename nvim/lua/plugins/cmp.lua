return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.preselect = cmp.PreselectMode.None
    opts.completion.completeopt = "menu,menuone,noinsert,noselect"

    -- Reset to minimal working set
    opts.mapping = {
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() then
            cmp.abort()
          end
          fallback()
        end,
      }),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }
  end,
}
