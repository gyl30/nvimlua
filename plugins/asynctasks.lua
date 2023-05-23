local asynctasks_cfg = function()
    vim.g.asyncrun_open = 15
    vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
end
return {
    { "skywind3000/asyncrun.vim",   event = "VeryLazy" },
    { "skywind3000/asynctasks.vim", config = asynctasks_cfg, event = "VeryLazy" },
}
