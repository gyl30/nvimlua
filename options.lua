-- set vim options here (vim.<first_key>.<second_key> = value)
return {
    opt = {
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true,          -- sets vim.opt.number
        spell = false,          -- sets vim.opt.spell
        signcolumn = "no",      -- sets vim.opt.signcolumn to auto
        foldcolumn = "0",
        wrap = false,           -- sets vim.opt.wrap
        tabstop = 4,
        shiftwidth = 4,
        softtabstop = 4,
        smarttab = true,
        expandtab = true,
        mouse = "",
        autochdir = true,
        showmode = false,
        sidescroll = 10,
        hidden = true,
        shortmess = 'aFc',
        hlsearch = true,
        incsearch = true,
        ignorecase = true,
        autowrite = true,
        confirm = true,
        scrolloff = 15,
        virtualedit = { "block", "onemore" },
        showtabline = 2,
        foldmethod = "expr",
        foldexpr = "nvim_treesitter#foldexpr()",
        foldlevel = 99,
        foldenable = false,
    },
    g = {
        mapleader = " ",                 -- sets vim.g.mapleader
        maplocalleader = ";",
        autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true,              -- enable completion at start
        autopairs_enabled = true,        -- enable autopairs at start
        diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
}
