return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- <leader>pf  → find files
    {
      "<leader>pf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope find files",
    },

    -- <C-p> → git files
    {
      "<C-p>",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Telescope git files",
    },

    -- <leader>ps → live grep
    {
      "<leader>ps",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope live grep",
    },
  },
}
