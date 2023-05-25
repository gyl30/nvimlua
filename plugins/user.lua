return {
    "andweeb/presence.nvim",
    { "stevearc/aerial.nvim",                enabled = false },
    { "mfussenegger/nvim-dap",               enabled = false },
    { "jay-babu/mason-nvim-dap.nvim",        enabled = false },
    { "rcarriga/nvim-dap-ui",                enabled = false },
    { "s1n7ax/nvim-window-picker",           enabled = false },
    { "stevearc/resession.nvim",             enabled = false },
    { "NMAC427/guess-indent.nvim",           enabled = false },
    { "famiu/bufdelete.nvim",                enabled = false },
    { "Shatur/neovim-session-manager",       enabled = false },
    { "lvimuser/lsp-inlayhints.nvim",        enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "jose-elias-alvarez/null-ls.nvim",     enabled = false },
    { "jay-babu/mason-null-ls.nvim",         enabled = false },

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
