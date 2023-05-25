vim.cmd [[
set signcolumn=no
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]
