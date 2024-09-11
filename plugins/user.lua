return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
    event = "BufRead",
  },
  {
    "tpope/vim-surround",
    lazy = true,
    event = "BufRead",
  },
  {
    "kkoomen/vim-doge",
    run = ":call doge#install()",
    lazy = true,
    event = "BufRead"
  },
  {
    "alpertuna/vim-header",
    lazy = true,
    event = "BufRead"
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "vim-scripts/DoxygenToolkit.vim",
    lazy = true,
    event = "BufRead"
  },
  {
    "hat0uma/prelive.nvim",
    opts = {},
    lazy = true,
    event = "BufRead",
    cmd = {
      "PreLiveGo",
      "PreLiveStatus",
      "PreLiveClose",
      "PreLiveCloseAll",
      "PreLiveLog",
    }
  },
  {
    "hat0uma/doxygen-previewer.nvim",
    lazy = true,
    event = "BufRead",
    opts = {},
    dependencies = { "hat0uma/prelive.nvim" },
    cmd = {
      "DoxygenOpen",
      "DoxygenUpdate",
      "DoxygenStop",
      "DoxygenLog",
      "DoxygenTempDoxyfileOpen"
    },
  }
}
