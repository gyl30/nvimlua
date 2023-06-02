local config = function()
    vim.cmd [[
        vmap <silent> <localleader>t <Cmd>lua require("translate").translateV()<cr>
        nmap <silent> <localleader>t <Cmd>lua require("translate").translateN()<cr>

        command! Translate  lua require("translate").translateN()
        command! TranslateV lua require("translate").translateV()
    ]]
end

return { "gyl30/translate", config = config, lazy = false }
