local lspkind_comparator = function(conf)
    local lsp_types = require('cmp.types').lsp
    return function(entry1, entry2)
        if entry1.source.name ~= 'nvim_lsp' then
            if entry2.source.name == 'nvim_lsp' then
                return false
            else
                return nil
            end
        end
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

        local priority1 = conf.kind_priority[kind1] or 0
        local priority2 = conf.kind_priority[kind2] or 0
        if priority1 == priority2 then
            return nil
        end
        return priority2 < priority1
    end
end

local label_comparator = function(entry1, entry2)
    return entry1.completion_item.label < entry2.completion_item.label
end
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
            "hrsh7th/nvim-cmp",
            opts = function(_, opts)
                local cmp = require "cmp"
                opts.completion = {
                    keyword_length = 2,
                }
                opts.matching = {
                    disallow_fuzzy_matching = true,
                    disallow_fullfuzzy_matching = true,
                    disallow_partial_fuzzy_matching = false,
                    disallow_partial_matching = false,
                    disallow_prefix_unmatching = true,
                }
                opts.sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
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
    updater = {
        remote = "origin",   
        channel = "nightly", 
        version = "latest",  
        commit = nil,        
        pin_plugins = nil,   
        skip_prompts = false,
        show_changelog = true,
        auto_quit = false,    
        remotes = {           
        },
    },

    -- colorscheme = "astrodark",
    -- colorscheme = "catppuccin",
    -- colorscheme = "sonokai",
    -- colorscheme = "github-theme",
    -- colorscheme = "everforest",
    -- colorscheme = "nightfox",
    -- colorscheme = "dracula",
    colorscheme = "vscode",
    -- colorscheme = "helix",
    -- colorscheme = "fluoromachine",

    lsp = {
        config = {
            setup_handlers = {
                clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
            },
            clangd = {
                capabilities = { offsetEncoding = "utf-8" },
            },
        },
        formatting = {
            format_on_save = {
                enabled = true,    
                allow_filetypes = {
                    "go",
                    "cpp",
                    "lua",
                },
                ignore_filetypes = { },
            },
            disabled = { },
            timeout_ms = 1000,
       },
        servers = {
            "clangd",
            "gopls",
            "lua_ls",
        },
    },
    lazy = {
        defaults = { lazy = true },
        change_detection = {
            enabled = false,
            notify = false, -- get a notification when changes are found
        },
        performance = {
            rtp = {
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },

    polish = function() require "user.autocmds" end,
}
