return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  "p00f/clangd_extensions.nvim", -- install lsp plugin
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" }, -- automatically install lsp
    },
  },
  { "lvimuser/lsp-inlayhints.nvim",        config = true },

  { "lukas-reineke/indent-blankline.nvim", enable = false },
}
