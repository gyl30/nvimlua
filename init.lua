return {
    -- add new user interface icon
    icons = {
        VimIcon = "",
        ScrollText = "",
        GitBranch = "",
        GitAdd = "",
        GitChange = "",
        GitDelete = "",
    },
    plugins = {
        {
            "projekt0n/github-nvim-theme",
            lazy = false,    -- make sure we load this during startup if it is your main colorscheme
            priority = 1000, -- make sure to load this before all the other start plugins
            config = function()
                require("github-theme").setup {}
                vim.cmd "colorscheme github_dark"
            end,
        },
        {
            -- override nvim-cmp plugin
            "hrsh7th/nvim-cmp",
            -- override the options table that is used in the `require("cmp").setup()` call
            opts = function(_, opts)
                local cmp = require "cmp"
                local lsp_types = require('cmp.types').lsp
                local kinds = {
                    Class         = { symbol = "", priority = 5 },
                    Color         = { symbol = "", priority = 5 },
                    Constant      = { symbol = "", priority = 10 },
                    Constructor   = { symbol = "", priority = 1 },
                    Enum          = { symbol = "", priority = 10 },
                    EnumMember    = { symbol = "", priority = 10 },
                    Event         = { symbol = "", priority = 10 },
                    Field         = { symbol = "", priority = 11 },
                    File          = { symbol = "", priority = 8 },
                    Folder        = { symbol = "", priority = 8 },
                    Function      = { symbol = "", priority = 10 },
                    Interface     = { symbol = "", priority = 1 },
                    Keyword       = { symbol = "", priority = 2 },
                    Method        = { symbol = "m", priority = 10 },
                    Module        = { symbol = "", priority = 5 },
                    Operator      = { symbol = "", priority = 10 },
                    Property      = { symbol = "", priority = 11 },
                    Reference     = { symbol = "", priority = 10 },
                    Snippet       = { symbol = "", priority = 4 },
                    Struct        = { symbol = "", priority = 10 },
                    Text          = { symbol = "", priority = 0 },
                    TypeParameter = { symbol = "", priority = 1 },
                    Unit          = { symbol = "", priority = 1 },
                    Value         = { symbol = "", priority = 1 },
                    Variable      = { symbol = "", priority = 9 },
                }

                local kind_comparator = function(symbols)
                    return function(entry1, entry2)
                        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
                        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

                        local priority1 = symbols[kind1]["priority"] or 0
                        local priority2 = symbols[kind2]["priority"] or 0
                        if priority1 == priority2 then
                            return nil
                        end
                        return priority1 > priority2
                    end
                end


                opts.sorting = {
                    priority_weight = 1.0,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        kind_comparator(kinds),
                        require 'clangd_extensions.cmp_scores',
                        cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    }
                }
                return opts
            end,
        },
    },
    -- Configure AstroNvim updates
    updater = {
        remote = "origin",     -- remote to use
        channel = "nightly",   -- "stable" or "nightly"
        version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        --    branch = "nightly", -- branch name (NIGHTLY ONLY)
        commit = nil,          -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false,  -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false,     -- automatically quit the current session after a successful update
        remotes = {            -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        },
    },

    -- Set colorscheme to use
    -- colorscheme = "astrodark",
    --colorscheme = "catppuccin",
    -- colorscheme = "sonokai",
    --colorscheme = "github-theme",
    -- colorscheme = "everforest",
    colorscheme = "nightfox",
    lsp = {
        config = {
            setup_handlers = {
                clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
            },
            clangd = {
                capabilities = { offsetEncoding = "utf-8" },
            },
        },
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true,     -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    "go",
                    "cpp",
                    "lua",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
                -- "lua_ls",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            "clangd",
            "gopls",
            "lua_ls",
        },
    },
    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        change_detection = {
            -- automatically check for config file changes and reload the ui
            enabled = false,
            notify = false, -- get a notification when changes are found
        },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },

    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function() require "user.autocmds" end,
}
