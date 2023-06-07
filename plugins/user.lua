return {
    "andweeb/presence.nvim",
    { "stevearc/aerial.nvim",          enabled = false },
    { "mfussenegger/nvim-dap",         enabled = false },
    { "jay-babu/mason-nvim-dap.nvim",  enabled = false },
    { "rcarriga/nvim-dap-ui",          enabled = false },
    { "s1n7ax/nvim-window-picker",     enabled = false },
    { "stevearc/resession.nvim",       enabled = false },
    { "NMAC427/guess-indent.nvim",     enabled = false },
    { "famiu/bufdelete.nvim",          enabled = false },
    { "Shatur/neovim-session-manager", enabled = false },
    {
        "lvimuser/lsp-inlayhints.nvim",
        enabled = true,
        event = "LspAttach",
        opts = {},
        config = function(_, opts)
            require("lsp-inlayhints").setup(opts)
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
                callback = function(args)
                    if not (args.data and args.data.client_id) then
                        return
                    end
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require("lsp-inlayhints").on_attach(client, args.buf)
                end,
            })
        end,

    },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "jose-elias-alvarez/null-ls.nvim",     enabled = false },
    { "jay-babu/mason-null-ls.nvim",         enabled = false },
    { "nvim-neo-tree/neo-tree.nvim",         enabled = false },
    { "leoluz/nvim-dap-go",                  enabled = false },
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
            local alpha = require("alpha")
            local startify = require("alpha.themes.startify")

            local function mru_title()
                return "MRU " .. vim.fn.getcwd()
            end

            startify.section.mru_cwd.val = {
                { type = "padding", val = 1 },
                { type = "text",    val = mru_title, opts = { hl = "SpecialComment", shrink_margin = false } },
                { type = "padding", val = 1 },
                {
                    type = "group",
                    val = function()
                        return { startify.mru(0, false, 13) }
                    end,

                    opts = { shrink_margin = false },
                },
            }

            startify.section.mru.val = {
                { type = "padding", val = 1 },
                { type = "text",    val = "MRU", opts = { hl = "SpecialComment" } },
                { type = "padding", val = 1 },
                {
                    type = "group",
                    val = function()
                        return { startify.mru(13, vim.fn.getcwd()) }
                    end,

                },
            }
            alpha.setup(startify.config)
        end,
    },
}
