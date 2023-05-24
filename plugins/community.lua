return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.dracula" },
  { import = "astrocommunity.colorscheme.monokai-pro" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.completion.codeium-vim" },
}
