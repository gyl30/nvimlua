return {
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  {
    "p00f/clangd_extensions.nvim",
    init = function() table.insert(astronvim.lsp.skip_setup, "clangd") end,
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    opts = function() return { server = require("astronvim.utils.lsp").config "clangd" } end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd" }, -- automatically install lsp
    },
  },
  { "lvimuser/lsp-inlayhints.nvim", enabled = false },

  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function() require("lspsaga").setup {} end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      local theme = require "alpha.themes.startify" --or require("alpha.themes.startify")
      require("alpha").setup(theme.config)
    end,
  },
}
