-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<space><space>"] = { "%", desc = "go to next" },
        ["<leader>bD"]     = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
                )
            end,
            desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"]      = { name = "Buffers" },
        ["<space>e"]       = { "<cmd> NvimTreeToggle <CR>", desc = "Toggle nvimtree" },
        ["<space>e"]       = { "<cmd> NvimTreeToggle <CR>", desc = "Toggle nvimtree" },
        ["<leader>h"]      = { "<cmd>Telescope man_pages sections={\"ALL\"}<CR>", desc = "Find help" },
        ["<leader>fb"]     = false,
        ["<leader>fC"]     = false,
        ["<leader>ff"]     = false,
        ["<leader>fF"]     = false,
        ["<leader>fn"]     = false,
        ["<leader>fo"]     = false,
        ["<leader>fr"]     = false,
        ["<leader>ft"]     = false,
        ["<leader>fw"]     = false,
        ["<leader>fW"]     = false,
        ["<leader>l"]      = false,
        ["<leader>lD"]     = false,
        ["<leader>ls"]     = false,
        ["<leader>tp"]     = false,
        ["<leader>th"]     = false,
        ["<leader>tv"]     = false,
        ["<F7>"]           = false,
        ["<C-'>"]          = false,
        ["<leader>ud"]     = false,
        ["<leader>ug"]     = false,
        ["<leader>ui"]     = false,
        ["<leader>ul"]     = false,
        ["<leader>uL"]     = false,
        ["<leader>un"]     = false,
        ["<leader>uN"]     = false,
        ["<leader>up"]     = false,
        ["<leader>us"]     = false,
        ["<leader>uS"]     = false,
        ["<leader>ut"]     = false,
        ["<leader>uu"]     = false,
        ["<leader>uw"]     = false,
        ["<leader>uy"]     = false,
        ["<leader>uh"]     = false,
        ["<leader>uC"]     = false,
        ["<leader>ub"]     = false,
    },
    t = {
        ["<F7>"]  = false,
        ["<C-'>"] = false,
    },

}
