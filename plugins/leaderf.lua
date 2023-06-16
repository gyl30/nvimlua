local leaderf_cfg = function()
    vim.g.Lf_GtagsAutoGenerate = 1
    vim.g.Lf_Gtagslabel = "native-pygments"
    vim.g.Lf_UseCache = 0
    vim.g.Lf_HideHelp = 1
    vim.g.Lf_MruMaxFiles = 2048
    vim.g.Lf_WindowHeight = 0.30
    vim.g.Lf_UseMemoryCache = 0
    vim.g.Lf_ShowRelativePath = 0
    vim.g.Lf_UseVersionControlTool = 0
    vim.g.Lf_IgnoreCurrentBufferName = 1
    vim.g.Lf_PreviewResult = { File = 0, Mru = 0, Tag = 0, Function = 0, BufTag = 0, Colorscheme = 0, Line = 0, Rg = 0 }
    vim.g.Lf_StlSeparator = { left = "", right = "", font = "" }
    vim.g.Lf_WildIgnore = {
        dir = { ".git", ".clangd", ".svn", ".hg", ".cache", ".build", ".deps", ".ccls-cache", "build" },
        file = { "*.exe", "*.o", "*.a", "*.so", "*.py[co]", "*.sw?", "*.bak", "*.d", "*.idx", "*.lint", "*.gcno" },
    }
    vim.g.Lf_WorkingDirectoryMode = "AF"
    vim.g.Lf_RootMarkers = { ".git", ".svn", ".hg", ".project", ".root" }
    vim.g.Lf_NormalMap = {
        File = { { "<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>' } },
        Buffer = { { "<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>' } },
        Mru = { { "<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>' } },
        Tag = { { "<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>' } },
        Function = { { "<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>' } },
        Colorscheme = { { "<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>' } },
    }
    --    vim.cmd('silent! unmap<leader>f')
    --   vim.cmd('silent! unmap<leader>b')
    vim.cmd [[
        nnoremap <silent><nowait> <localleader>f :LeaderfFunction<cr>
        nnoremap <silent><nowait> <localleader>m :LeaderfMru<cr>
        nnoremap <silent><nowait> <C-p> :LeaderfFile<cr>
        nnoremap <silent><nowait> <leader>fh :LeaderfHelp<cr>
        nnoremap <silent><nowait> <leader>fl :LeaderfLine<cr>
    ]]
end

return {
    "Yggdroot/LeaderF",
    build = ":LeaderfInstallCExtension",
    config = leaderf_cfg,
    init = function()
        vim.g.Lf_ShortcutF = ""
        vim.g.Lf_ShortcutB = ""
    end,
    event = "VeryLazy",
}
