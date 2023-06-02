local function make_header()
    local tableTime = os.date("*t")
    local datetime = os.date(" %Y-%m-%d   %H:%M:%S")
    local hour = tableTime.hour
    local greetingsTable = {
        [1] = "  Sleep Well",
        [2] = "  Good Morning",
        [3] = "  Good Afternoon",
        [4] = "  Good Evening",
        [5] = "󰖔  Good Night",
    }
    local greetingIndex = 0
    if hour == 23 or hour < 7 then
        greetingIndex = 1
    elseif hour < 12 then
        greetingIndex = 2
    elseif hour >= 12 and hour < 18 then
        greetingIndex = 3
    elseif hour >= 18 and hour < 21 then
        greetingIndex = 4
    elseif hour >= 21 then
        greetingIndex = 5
    end
    return "\t" .. datetime .. "\t" .. greetingsTable[greetingIndex]
end
return {
    -- customize alpha options
    {
        "goolord/alpha-nvim",
        opts = function(_, opts)
            local header = make_header()
            opts.section.header.val = header
            return opts
        end,
    },
    -- You can disable default plugins as follows:
    -- { "max397574/better-escape.nvim", enabled = false },
    --
    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require "plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
            -- add more custom autopairs configuration such as custom rules
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"
            local cond = require "nvim-autopairs.conds"
            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                    -- don't add a pair if the next character is %
                        :with_pair(cond.not_after_regex "%%")
                    -- don't add a pair if  the previous character is xxx
                        :with_pair(
                            cond.not_before_regex("xxx", 3)
                        )
                    -- don't move right when repeat character
                        :with_move(cond.none())
                    -- don't delete if the next character is xx
                        :with_del(cond.not_after_regex "xx")
                    -- disable adding a newline when you press <cr>
                        :with_cr(cond.none()),
                },
                -- disable for .vim files, but it work for another filetypes
                Rule("a", "a", "-vim")
            )
        end,
    },
    -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
    {
        "folke/which-key.nvim",
        enabled = false,
    },
}
