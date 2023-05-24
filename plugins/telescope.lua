return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = function(_, opts)
    local actions = require "telescope.actions"
    return require("astronvim.utils").extend_tbl(opts, {
      pickers = {
        lsp_references = {
          layout_strategy = "vertical",
          show_line = false,
          layout_config = {
            prompt_position = "bottom",
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        live_grep = {
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "bottom",
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
      },
    })
  end,
  config = function(...)
    require "plugins.configs.telescope" (...)
    local telescope = require "telescope"
    telescope.load_extension "undo"
    telescope.load_extension "file_browser"
  end,
}
