return function(client, bufnr)
    if client.server_capabilities.inlayHintProvider then
        local inlayhints_avail, inlayhints = pcall(require, "lsp-inlayhints")
        if inlayhints_avail then
            inlayhints.on_attach(client, bufnr)
            vim.keymap.set("n", "<leader>uH", function() inlayhints.toggle() end, { desc = "Toggle inlay hints" })
        end
    end
    if client.name == 'gopls' and not client.server_capabilities.semanticTokensProvider then
        local semantic = client.config.capabilities.textDocument.semanticTokens
        client.server_capabilities.semanticTokensProvider = {
            full = true,
            legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
            range = true,
        }
    end
end
