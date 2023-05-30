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
        ["<space><space>"]  = { "%", desc = "go to next" },
        ["<leader>bD"]      = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
                )
            end,
            desc = "Pick to close",
        },
        ["<leader>J"]       = {
            function()
                vim.cmd([[
                      normal! mzJ`z
                      delmarks z
                  ]])
            end,
            desc = "join line",
        },
        ["<leader>gJ"]      = {
            function()
                vim.cmd([[
                      normal! mzgJ`z
                      delmarks z
                  ]])
            end,
            desc = "join visual line",
        },

        ["<localleader>ss"] = {
            function()
                local cnt = 0
                local blink_times = 7
                local timer = vim.loop.new_timer()

                timer:start(0, 100, vim.schedule_wrap(function()
                    vim.cmd [[
                      set cursorcolumn!
                      set cursorline!
                    ]]

                    if cnt == blink_times then
                        timer:close()
                    end

                    cnt = cnt + 1
                end))
            end,
            desc = "find cursor",
        },

        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"]       = { name = "Buffers" },
        ["<space>e"]        = { "<cmd> NvimTreeToggle <CR>", desc = "Toggle nvimtree" },
        ["<leader>m"]       = { "<cmd>Telescope man_pages sections={\"ALL\"}<CR>", desc = "Find help" },
        ["<leader>fb"]      = false,
        ["<leader>fC"]      = false,
        ["<leader>ff"]      = false,
        ["<leader>fF"]      = false,
        ["<leader>fn"]      = false,
        ["<leader>fm"]      = false,
        ["<leader>fo"]      = false,
        ["<leader>fr"]      = false,
        ["<leader>ft"]      = false,
        ["<leader>fw"]      = false,
        ["<leader>fW"]      = false,
        ["<leader>l"]       = false,
        ["<leader>lD"]      = false,
        ["<leader>ls"]      = false,
        ["<leader>tp"]      = false,
        ["<leader>th"]      = false,
        ["<leader>tv"]      = false,
        ["<F7>"]            = false,
        ["<C-'>"]           = false,
        ["<leader>ud"]      = false,
        ["<leader>ug"]      = false,
        ["<leader>ui"]      = false,
        ["<leader>ul"]      = false,
        ["<leader>uL"]      = false,
        ["<leader>un"]      = false,
        ["<leader>uN"]      = false,
        ["<leader>up"]      = false,
        ["<leader>us"]      = false,
        ["<leader>uS"]      = false,
        ["<leader>ut"]      = false,
        ["<leader>uu"]      = false,
        ["<leader>uw"]      = false,
        ["<leader>uy"]      = false,
        ["<leader>uh"]      = false,
        ["<leader>uC"]      = false,
        ["<leader>ub"]      = false,
        ["<leader>bb"]      = false,
        ["<leader>bC"]      = false,
        ["<leader>bd"]      = false,
        ["<leader>bD"]      = false,
        ["<leader>bl"]      = false,
    },
    t = {
        ["<F7>"]  = false,
        ["<C-'>"] = false,
    },

}
